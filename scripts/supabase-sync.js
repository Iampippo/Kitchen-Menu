import 'dotenv/config';

// Supabase数据同步CLI工具
// 此脚本用于自动将CSV数据转换为SQL并上传到Supabase执行

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { createClient } from '@supabase/supabase-js';
import { exec } from 'child_process';
import readline from 'readline';

// 获取当前文件目录
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 读取环境变量
const SUPABASE_URL = process.env.SUPABASE_URL;
const SUPABASE_KEY = process.env.SUPABASE_KEY;

// 文件路径
const SQL_DIR = path.join(__dirname, '../sql');
const GENERATED_SQL = path.join(SQL_DIR, 'generated_inserts.sql');
const IMPORT_SQL = path.join(SQL_DIR, 'direct_import.sql');

// 创建Supabase客户端
function createSupabaseClient() {
  if (!SUPABASE_URL || !SUPABASE_KEY) {
    console.error('错误: 缺少环境变量SUPABASE_URL或SUPABASE_KEY');
    console.error('请设置环境变量或创建.env文件');
    process.exit(1);
  }
  
  try {
    return createClient(SUPABASE_URL, SUPABASE_KEY);
  } catch (error) {
    console.error('创建Supabase客户端失败:', error.message);
    process.exit(1);
  }
}

// 读取用户输入
function question(query) {
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
  });

  return new Promise(resolve => {
    rl.question(query, answer => {
      rl.close();
      resolve(answer);
    });
  });
}

// 将生成的SQL上传到Supabase并执行
async function uploadAndExecuteSQL(sqlContent) {
  console.log('开始连接Supabase...');
  const supabase = createSupabaseClient();
  
  console.log('准备执行SQL语句...');
  try {
    // 分批执行SQL，因为内容可能很大
    const MAX_BATCH_SIZE = 200000; // 提高批次大小限制 (例如 20万字符)
    
    if (sqlContent.length > MAX_BATCH_SIZE) {
      console.log(`SQL内容较大(${sqlContent.length}字符)，将分批执行...`);
      
      // 按SQL语句分段进行处理
      const statements = sqlContent.split(';');
      let currentBatch = '';
      let batchNumber = 1;
      
      for (const statement of statements) {
        const trimmedStatement = statement.trim();
        if (!trimmedStatement) continue;
        
        // 检查当前批次加上新语句是否超过限制
        if ((currentBatch + trimmedStatement).length > MAX_BATCH_SIZE) {
          // 如果超过，先执行当前批次
          if (currentBatch) {
            console.log(`执行批次 ${batchNumber}...`);
            const { error } = await supabase.rpc('exec_sql', {
              sql_string: currentBatch + ';'
            });
            
            if (error) throw error;
            
            // 重置批次
            currentBatch = '';
            batchNumber++;
          }
        }
        
        // 添加语句到当前批次
        currentBatch += trimmedStatement + ';';
      }
      
      // 执行最后一批
      if (currentBatch) {
        console.log(`执行批次 ${batchNumber}...`);
        const { error } = await supabase.rpc('exec_sql', {
          sql_string: currentBatch
        });
        
        if (error) throw error;
      }
    } else {
      // 如果SQL内容较小，一次性执行
      console.log('一次性执行SQL...');
      const { error } = await supabase.rpc('exec_sql', { 
        sql_string: sqlContent 
      });
      
      if (error) throw error;
    }
    
    // 执行导入逻辑
    console.log('执行导入逻辑...');
    
    console.log('SQL执行成功!');
    return true;
  } catch (error) {
    console.error('执行SQL失败:', error.message);
    console.error('错误详情:', error);
    return false;
  }
}

// 生成SQL文件
function generateSQL() {
  return new Promise((resolve, reject) => {
    console.log('生成SQL文件...');
    exec('node scripts/convert_csv_to_sql.js', (error, stdout, stderr) => {
      if (error) {
        console.error(`执行错误: ${error.message}`);
        return reject(error);
      }
      if (stderr) {
        console.error(`标准错误: ${stderr}`);
      }
      console.log(stdout);
      resolve();
    });
  });
}

// 验证导入结果
async function verifyImport(supabase) {
  console.log('验证导入结果...');
  
  try {
    // 查询系统食材总数
    const { data: ingredientData, error: ingredientError } = await supabase
      .from('ingredients')
      .select('count', { count: 'exact' })
      .eq('user_id', '00000000-0000-0000-0000-000000000000');
    
    if (ingredientError) throw ingredientError;
    
    // 查询使用CSV_前缀的食材数量
    const { data: csvIngredientData, error: csvIngredientError, count: csvIngredientCount } = await supabase
      .from('ingredients')
      .select('*', { count: 'exact', head: true }) // 只获取数量，不获取数据
      .ilike('name', 'CSV_%');
    
    if (csvIngredientError) throw csvIngredientError;
    
    // 查询菜谱总数
    const { data: recipeData, error: recipeError, count: recipeCount } = await supabase
      .from('recipes')
      .select('*', { count: 'exact', head: true });
    
    if (recipeError) throw recipeError;
    
    // 查询使用CSV_前缀的菜谱数量
    const { data: csvRecipeData, error: csvRecipeError, count: csvRecipeCount } = await supabase
      .from('recipes')
      .select('*', { count: 'exact', head: true })
      .ilike('name', 'CSV_%');
    
    if (csvRecipeError) throw csvRecipeError;
    
    // 查询菜谱食材关系总数
    const { data: recipeIngredientData, error: recipeIngredientError, count: recipeIngredientRelationCount } = await supabase
      .from('recipe_ingredients')
      .select('*', { count: 'exact', head: true });
    
    if (recipeIngredientError) throw recipeIngredientError;
    
    // 查询CSV_菜谱的食材关系数量
    const { data: csvRelationData, error: csvRelationError } = await supabase.rpc(
      'exec_sql',
      {
        sql_string: `
          SELECT COUNT(*) AS count FROM recipe_ingredients 
          WHERE recipe_id IN (SELECT id FROM recipes WHERE name ILIKE 'CSV_%')
        `
      }
    );
    
    if (csvRelationError) throw csvRelationError;
    const csvRelationCount = csvRelationData && Array.isArray(csvRelationData) && csvRelationData.length > 0 && csvRelationData[0].count !== undefined ? csvRelationData[0].count : '未知';

    // 输出验证结果
    console.log('验证结果:');
    console.log(`- 系统食材总数: ${ingredientData ? ingredientData[0].count : 0} 种`);
    console.log(`- CSV导入食材: ${csvIngredientCount || 0} 种`);
    console.log(`- 菜谱总数: ${recipeCount || 0} 个`);
    console.log(`- CSV导入菜谱: ${csvRecipeCount || 0} 个`);
    console.log(`- 菜谱食材关系总数: ${recipeIngredientRelationCount || 0} 条`);
    console.log(`- CSV菜谱食材关系: ${csvRelationCount} 条`);
    
    return true;
  } catch (error) {
    console.error('验证结果失败:', error.message);
    return false;
  }
}

// 主函数
async function main() {
  console.log('=== Supabase数据同步工具 (简化测试模式) ===');
  
  // 检查环境变量
  if (!SUPABASE_URL || !SUPABASE_KEY) {
    console.log('未检测到环境变量，请输入Supabase连接信息:');
    const url = await question('Supabase URL: ');
    const key = await question('Supabase Key (service_role密钥): ');
    process.env.SUPABASE_URL = url;
    process.env.SUPABASE_KEY = key;
  }
  
  try {
    // 创建一个完整的处理流程
    
    // 第一步：生成SQL文件
    console.log('=== 第一步: 从CSV生成SQL文件 ===');
    await generateSQL();
    
    // 第二步：检查必要的基础数据
    console.log('=== 第二步: 检查并设置系统用户和食材分类 ===');
    const setupSqlPath = path.join(SQL_DIR, 'ingredients_categories_setup.sql');
    if (!fs.existsSync(setupSqlPath)) {
      console.error(`错误: 找不到基础数据设置SQL文件 ${setupSqlPath}`);
      process.exit(1);
    }
    
    // 执行基础数据设置
    const setupSqlContent = fs.readFileSync(setupSqlPath, 'utf8');
    console.log('将执行基础数据设置SQL：');
    let answer = await question('是否继续执行基础数据设置? (y/n): ');
    if (answer.toLowerCase() !== 'y') {
      console.log('基础数据设置已跳过，继续后续步骤');
    } else {
      const setupSuccess = await uploadAndExecuteSQL(setupSqlContent);
      if (!setupSuccess) {
        console.log('基础数据设置执行失败，请检查错误信息');
        const continueAnyway = await question('是否继续后续步骤? (y/n): ');
        if (continueAnyway.toLowerCase() !== 'y') {
          console.log('操作已取消');
          process.exit(0);
        }
      }
    }
    
    // 第三步：执行导入逻辑
    console.log('=== 第三步: 执行菜谱导入 ===');
    const importSqlPath = path.join(SQL_DIR, 'generated_inserts.sql');
    if (!fs.existsSync(importSqlPath)) {
      console.error(`错误: 找不到生成的SQL文件 ${importSqlPath}`);
      process.exit(1);
    }
    
    const importSqlContent = fs.readFileSync(importSqlPath, 'utf8');
    
    console.log(`将执行导入SQL: ${importSqlPath}`);
    answer = await question('是否继续执行导入SQL? (y/n): ');
    if (answer.toLowerCase() !== 'y') {
      console.log('操作已取消');
      process.exit(0);
    }
    
    const success = await uploadAndExecuteSQL(importSqlContent);
    
    if (success) {
      console.log('导入SQL执行完成。请检查Supabase控制台的输出和查询结果。');
      
      // 验证导入结果
      console.log('=== 第四步: 验证导入结果 ===');
      const supabase = createSupabaseClient();
      await verifyImport(supabase);
    } else {
      console.log('导入SQL执行失败，请查看错误信息');
    }

  } catch (error) {
    console.error('执行过程中出错:', error.message);
    process.exit(1);
  }
}

// 执行主函数
main(); 