// 将CSV文件转换为SQL插入语句的工具脚本

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { parse } from 'csv-parse/sync';

// 获取当前文件目录
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// 定义CSV文件路径
const INGREDIENTS_CSV = path.join(__dirname, '../kitchen_seeds_csv/01_ingredients_au.csv');
const RECIPES_CSV = path.join(__dirname, '../kitchen_seeds_csv/02_recipes_cn_west.csv');
const RECIPE_ITEMS_CSV = path.join(__dirname, '../kitchen_seeds_csv/03_recipe_items.csv');

// 输出SQL文件路径
const OUTPUT_SQL = path.join(__dirname, '../sql/generated_inserts.sql');

// 处理特殊字符，避免SQL注入
function escapeSql(str) {
  if (str === undefined || str === null) return 'NULL';
  return `'${str.toString().replace(/'/g, "''")}'`;
}

// 读取并解析CSV文件
function readCsv(filePath) {
  const fileContent = fs.readFileSync(filePath, 'utf8');
  return parse(fileContent, {
    columns: true,
    skip_empty_lines: true
  });
}

// 生成食材插入语句
function generateIngredientsInserts(data) {
  let sql = '-- 食材临时表插入语句\n';
  sql += 'TRUNCATE TABLE IF EXISTS imported_ingredients;\n\n';
  
  data.forEach(row => {
    sql += `INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES (`;
    sql += `${escapeSql(row.name)}, `;
    sql += `${escapeSql(row.type)}, `;
    sql += `${escapeSql(row.default_unit)}, `;
    sql += `${escapeSql(row.category)}, `;
    sql += `${escapeSql(row.note_au)});\n`;
  });
  
  return sql;
}

// 生成菜谱插入语句
function generateRecipesInserts(data) {
  let sql = '\n-- 菜谱临时表插入语句\n';
  sql += 'TRUNCATE TABLE IF EXISTS imported_recipes;\n\n';
  
  data.forEach(row => {
    sql += `INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES (`;
    sql += `${escapeSql(row.title)}, `;
    sql += `${escapeSql(row.intro_md)}, `;
    sql += `${escapeSql(row.cuisine)}, `;
    sql += `${escapeSql(row.difficulty)}, `;
    sql += `${escapeSql(row.est_minutes)});\n`;
  });
  
  return sql;
}

// 生成菜谱食材关系插入语句
function generateRecipeItemsInserts(data) {
  let sql = '\n-- 菜谱食材关系临时表插入语句\n';
  sql += 'TRUNCATE TABLE IF EXISTS imported_recipe_items;\n\n';
  
  data.forEach(row => {
    sql += `INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES (`;
    sql += `${escapeSql(row.recipe_title)}, `;
    sql += `${escapeSql(row.item_name)}, `;
    sql += `${escapeSql(row.qty)}, `;
    sql += `${escapeSql(row.unit)});\n`;
  });
  
  return sql;
}

// 主函数
function main() {
  try {
    console.log('读取CSV文件...');
    
    // 确保sql目录存在
    const sqlDir = path.join(__dirname, '../sql');
    if (!fs.existsSync(sqlDir)) {
      fs.mkdirSync(sqlDir, { recursive: true });
    }
    
    const ingredientsData = readCsv(INGREDIENTS_CSV);
    const recipesData = readCsv(RECIPES_CSV);
    const recipeItemsData = readCsv(RECIPE_ITEMS_CSV);
    
    console.log(`解析完成：${ingredientsData.length}种食材，${recipesData.length}份菜谱，${recipeItemsData.length}条菜谱食材关系`);
    
    // 生成SQL插入语句
    let sql = '-- 由convert_csv_to_sql.js生成的插入语句\n';
    sql += '-- 生成时间：' + new Date().toISOString() + '\n\n';
    
    // 创建临时表
    sql += '-- 创建临时表\n';
    sql += `
CREATE TEMP TABLE IF NOT EXISTS imported_ingredients (
  name text,
  type text,
  default_unit text,
  category text,
  note_au text
);

CREATE TEMP TABLE IF NOT EXISTS imported_recipes (
  title text,
  intro_md text,
  cuisine text,
  difficulty integer,
  est_minutes integer
);

CREATE TEMP TABLE IF NOT EXISTS imported_recipe_items (
  recipe_title text,
  item_name text,
  qty text,
  unit text
);
\n`;
    
    // 添加数据插入语句
    sql += generateIngredientsInserts(ingredientsData);
    sql += generateRecipesInserts(recipesData);
    sql += generateRecipeItemsInserts(recipeItemsData);
    
    // 添加导入脚本引用
    sql += '\n-- 执行导入脚本\n';
    sql += '\\i ./import_full_process.sql\n';
    
    // 写入SQL文件
    fs.writeFileSync(OUTPUT_SQL, sql);
    
    console.log(`SQL语句已生成到 ${OUTPUT_SQL}`);
  } catch (error) {
    console.error('生成SQL语句时出错：', error);
    process.exit(1);
  }
}

// 执行主函数
main(); 