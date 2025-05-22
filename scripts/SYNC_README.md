# Kitchen Helper菜谱数据同步工具使用指南

## 概述

该工具用于将CSV格式的菜谱数据导入Supabase数据库。它能够处理以下数据：

- 食材数据 (ingredients)
- 菜谱数据 (recipes)
- 菜谱食材关系数据 (recipe_ingredients)

## 前置条件

在使用此工具前，请确保：

1. Supabase项目已创建并正常运行
2. 已安装Node.js环境
3. 已设置环境变量或准备好Supabase连接信息
4. CSV文件已放置在正确位置

## 环境变量设置

工具需要以下环境变量：

```
SUPABASE_URL=你的Supabase项目URL
SUPABASE_KEY=你的Supabase服务角色密钥
```

你可以通过以下方式设置环境变量：

- 创建项目根目录下的.env文件并填入上述信息
- 运行时在命令行中临时设置
- 在操作系统中永久设置

## CSV文件准备

将以下CSV文件放置在`kitchen_seeds_csv/`目录下：

1. `01_ingredients_au.csv` - 食材数据
2. `02_recipes_cn_west.csv` - 菜谱数据 
3. `03_recipe_items.csv` - 菜谱食材关系数据

CSV文件格式示例：

**食材 (01_ingredients_au.csv)**:
```
name,type,default_unit,category,note_au
Tomato,ingredient,pcs,veg,
Chicken thigh,ingredient,grams,meat,
```

**菜谱 (02_recipes_cn_west.csv)**:
```
title,intro_md,cuisine,difficulty,est_minutes
番茄炒鸡蛋,"经典留学生快手菜，10分钟搞定，营养又下饭。",Chinese,1,15
```

**菜谱食材关系 (03_recipe_items.csv)**:
```
recipe_title,item_name,qty,unit
番茄炒鸡蛋,Tomato,2,pcs
番茄炒鸡蛋,Egg,3,pcs
```

## 使用方法

### 一键导入（推荐）

在项目根目录执行：

```bash
npm run sync-recipes
```

此命令会执行以下步骤：

1. 从CSV生成SQL插入语句
2. 检查并设置系统用户和食材分类（如果不存在）
3. 执行菜谱数据导入
4. 验证导入结果

### 导入过程详解

1. **基础数据设置**
   - 创建系统用户（如不存在）
   - 创建食材分类（如不存在）

2. **临时表创建**
   - 为CSV数据创建临时表

3. **数据导入**
   - 导入食材
   - 导入菜谱
   - 导入菜谱与食材的关系

4. **验证结果**
   - 检查导入的记录数量
   - 查看导入的食材、菜谱及关系样本

## 常见问题

**Q: 导入后看不到数据？**  
A: 请检查：
- 是否已正确设置环境变量
- CSV格式是否正确
- 系统用户ID和食材分类是否已创建
- Supabase权限设置是否允许数据插入

**Q: 导入时出现错误？**  
A: 可能原因：
- CSV数据格式不正确
- 数据库约束冲突
- SQL语法错误
- 缺少系统用户或食材分类

**Q: 如何清理之前导入的数据？**  
A: 执行以下SQL：
```sql
DELETE FROM recipe_ingredients WHERE recipe_id IN (SELECT id FROM recipes WHERE name LIKE 'CSV_%');
DELETE FROM recipe_tags WHERE recipe_id IN (SELECT id FROM recipes WHERE name LIKE 'CSV_%');
DELETE FROM recipe_steps WHERE recipe_id IN (SELECT id FROM recipes WHERE name LIKE 'CSV_%');
DELETE FROM recipes WHERE name LIKE 'CSV_%';
DELETE FROM ingredients WHERE name LIKE 'CSV_%' AND user_id = '00000000-0000-0000-0000-000000000000';
```

## 高级用法

### 修改导入逻辑

如需修改导入逻辑，可编辑以下文件：

- `sql/import_full_process.sql` - 完整导入流程
- `sql/ingredients_categories_setup.sql` - 基础数据设置

### 手动执行部分步骤

如需单独执行某些步骤：

1. 生成SQL文件：
```bash
node scripts/convert_csv_to_sql.js
```

2. 执行基础数据设置：
```bash
node -e "import('fs').then(fs => import('@supabase/supabase-js').then(({createClient}) => { const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_KEY); return supabase.rpc('exec_sql', {sql_string: fs.readFileSync('./sql/ingredients_categories_setup.sql', 'utf8')}).then(console.log) }))"
``` 