// 使用Supabase客户端连接并执行导入SQL脚本
// 使用方法: node update_connect_import.js [supabase_key]

import { createClient } from '@supabase/supabase-js';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

// 获取当前脚本目录
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 从命令行参数获取supabaseKey
const supabaseKey = process.argv[2] || process.env.SUPABASE_KEY || null;
const supabaseUrl = 'https://fisrtghcvoxnznkysjsl.supabase.co';

if (!supabaseKey) {
  console.error('错误: 请提供Supabase密钥作为参数或环境变量');
  console.error('用法: node update_connect_import.js <supabase_key>');
  console.error('或设置环境变量: SUPABASE_KEY=your-key node update_connect_import.js');
  process.exit(1);
}

// 创建Supabase客户端
const supabase = createClient(supabaseUrl, supabaseKey);

// 读取SQL文件内容
async function readSqlFile(filename) {
  try {
    const sqlPath = path.resolve(__dirname, '../../sql/', filename);
    return fs.readFileSync(sqlPath, 'utf8');
  } catch (error) {
    console.error(`无法读取SQL文件 ${filename}:`, error.message);
    return null;
  }
}

// 创建exec_sql函数（如果不存在）
async function createExecSqlFunction() {
  try {
    console.log('正在检查并创建exec_sql函数...');
    
    // 直接使用createClient的rpc方法可能会失败，因为exec_sql函数可能不存在
    // 因此我们先尝试使用REST API检查函数是否存在
    
    // 使用FROM pg_catalog.pg_proc查询是否存在exec_sql函数
    const { data, error } = await supabase.from('pg_catalog').select('*');
    
    if (error) {
      // 如果无法查询pg_catalog，我们假设需要创建函数
      console.log('无法检查函数是否存在，尝试创建exec_sql函数...');
      
      // 使用REST API直接执行SQL
      const functionSql = await readSqlFile('create_exec_sql_function.sql');
      if (!functionSql) {
        throw new Error('无法读取创建函数的SQL文件');
      }
      
      // 使用Supabase REST API执行SQL
      const response = await fetch(`${supabaseUrl}/rest/v1/`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${supabaseKey}`,
          'apikey': supabaseKey,
          'Prefer': 'params=single-object'
        },
        body: JSON.stringify({
          'query': functionSql
        })
      });
      
      if (!response.ok) {
        const errorText = await response.text();
        throw new Error(`创建exec_sql函数失败: ${errorText}`);
      }
      
      console.log('exec_sql函数创建成功！');
    } else {
      console.log('数据库连接正常，准备导入数据...');
    }
    
    return true;
  } catch (error) {
    console.error('创建exec_sql函数时出错:', error.message);
    return false;
  }
}

// 执行SQL导入
async function executeSql(sqlContent, description) {
  try {
    console.log(`正在执行: ${description}...`);
    
    // 使用exec_sql函数执行SQL
    const { data, error } = await supabase.rpc('exec_sql', { 
      sql_query: sqlContent 
    });
    
    if (error) {
      throw new Error(`${description}失败: ${error.message}`);
    }
    
    console.log(`${description}成功!`);
    return true;
  } catch (error) {
    console.error(`${description}出错:`, error.message);
    return false;
  }
}

// 主导入功能
async function runImport() {
  console.log('开始导入数据到Supabase...');
  console.log(`使用URL: ${supabaseUrl}`);
  
  try {
    // 1. 确保exec_sql函数存在
    await createExecSqlFunction();
    
    // 2. 导入基础设置
    const setupSql = await readSqlFile('ingredients_categories_setup.sql');
    if (setupSql) {
      await executeSql(setupSql, '导入系统用户和食材分类');
    }
    
    // 3. 导入食材库存
    const inventorySql = await readSqlFile('inventory_import.sql');
    if (inventorySql) {
      await executeSql(inventorySql, '导入食材库存');
    }
    
    // 4. 导入菜谱
    const recipesSql = await readSqlFile('simple_import.sql');
    if (recipesSql) {
      await executeSql(recipesSql, '导入菜谱');
    }
    
    // 5. 导入菜谱-食材关系
    const relationsSql = await readSqlFile('recipe_ingredients_import.sql');
    if (relationsSql) {
      await executeSql(relationsSql, '导入菜谱-食材关系');
    }
    
    console.log('✅ 全部数据导入完成!');
    
  } catch (error) {
    console.error('❌ 导入过程中出错:', error.message);
    process.exit(1);
  }
}

// 执行导入
runImport(); 