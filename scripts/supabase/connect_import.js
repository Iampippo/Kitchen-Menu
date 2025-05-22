// 使用Supabase客户端连接并执行导入SQL脚本
// 使用方法: node connect_import.js

import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

// 获取当前脚本目录
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 配置（从环境变量或命令行参数获取）
const supabaseUrl = process.env.SUPABASE_URL || 'https://fisrtghcvoxnznkysjsl.supabase.co';
const supabaseKey = process.env.SUPABASE_KEY || '你的Supabase密钥';

if (!supabaseUrl || !supabaseKey || supabaseKey === '你的Supabase密钥') {
  console.error('错误: 请设置SUPABASE_URL和SUPABASE_KEY环境变量');
  console.error('例如: SUPABASE_URL=https://your-project.supabase.co SUPABASE_KEY=your-key node connect_import.js');
  process.exit(1);
}

// 创建Supabase客户端
const supabase = createClient(supabaseUrl, supabaseKey);

// 读取SQL文件
async function readSqlFile(filename) {
  const sqlPath = path.resolve(__dirname, '../../sql/', filename);
  try {
    return fs.readFileSync(sqlPath, 'utf8');
  } catch (error) {
    console.error(`无法读取SQL文件 ${filename}:`, error.message);
    return null;
  }
}

// 执行导入
async function runImport() {
  console.log('开始导入数据到Supabase...');
  
  try {
    // 0. 检查连接
    console.log('测试Supabase连接...');
    const { data: connTest, error: connError } = await supabase.from('profiles').select('count(*)', { count: 'exact' });
    
    if (connError) {
      throw new Error(`连接测试失败: ${connError.message}`);
    }
    
    console.log('连接成功!');
    
    // 1. 导入基础设置
    console.log('导入系统用户和食材分类...');
    const setupSql = await readSqlFile('ingredients_categories_setup.sql');
    if (!setupSql) {
      throw new Error('无法读取基础设置SQL文件');
    }
    
    const { data: setupData, error: setupError } = await supabase.rpc('exec_sql', { sql_query: setupSql });
    if (setupError) {
      throw new Error(`设置基础数据失败: ${setupError.message}`);
    }
    
    console.log('基础设置导入成功!');
    
    // 2. 导入食材库存
    console.log('导入食材库存...');
    const inventorySql = await readSqlFile('inventory_import.sql');
    if (!inventorySql) {
      throw new Error('无法读取食材库存SQL文件');
    }
    
    const { data: invData, error: invError } = await supabase.rpc('exec_sql', { sql_query: inventorySql });
    if (invError) {
      throw new Error(`导入食材库存失败: ${invError.message}`);
    }
    
    console.log('食材库存导入成功!');
    
    // 3. 导入菜谱
    console.log('导入菜谱...');
    const recipesSql = await readSqlFile('simple_import.sql');
    if (!recipesSql) {
      throw new Error('无法读取菜谱SQL文件');
    }
    
    const { data: recipesData, error: recipesError } = await supabase.rpc('exec_sql', { sql_query: recipesSql });
    if (recipesError) {
      throw new Error(`导入菜谱失败: ${recipesError.message}`);
    }
    
    console.log('菜谱导入成功!');
    
    // 4. 导入菜谱-食材关系
    console.log('导入菜谱-食材关系...');
    const relationsSql = await readSqlFile('recipe_ingredients_import.sql');
    if (!relationsSql) {
      throw new Error('无法读取菜谱-食材关系SQL文件');
    }
    
    const { data: relData, error: relError } = await supabase.rpc('exec_sql', { sql_query: relationsSql });
    if (relError) {
      throw new Error(`导入菜谱-食材关系失败: ${relError.message}`);
    }
    
    console.log('菜谱-食材关系导入成功!');
    
    // 5. 验证导入结果
    const { data: ingCount, error: ingCountError } = await supabase
      .from('ingredients')
      .select('count(*)', { count: 'exact' })
      .eq('user_id', '00000000-0000-0000-0000-000000000000');
      
    const { data: recipeCount, error: recipeCountError } = await supabase
      .from('recipes')
      .select('count(*)', { count: 'exact' });
      
    if (!ingCountError && !recipeCountError) {
      console.log(`导入结果: ${ingCount.count} 种食材, ${recipeCount.count} 个菜谱`);
    }
    
    console.log('✅ 数据导入完成!');
    
  } catch (error) {
    console.error('❌ 导入过程中出错:', error.message);
    process.exit(1);
  }
}

// 执行导入
runImport(); 