# Supabase SQL脚本使用说明

本目录包含厨房助手应用的数据库脚本。

## 重要脚本文件

- `system-ingredients.sql` - 系统食材初始化脚本
- `recipes.sql` - 基础菜谱数据
- `import_recipes.sql` - 导入新菜谱的逻辑脚本
- `generated_inserts.sql` - 通过CSV生成的临时表数据(由convert_csv_to_sql.js脚本生成)

## 菜谱导入步骤

要将CSV数据导入到Supabase数据库中，请按照以下步骤操作：

### 1. 准备工作

- 确保已登录Supabase管理控制台
- 打开项目的SQL编辑器

### 2. 执行导入脚本

1. 导入分两步：先将CSV数据导入临时表，再从临时表导入实际数据库表
2. 将`generated_inserts.sql`的内容复制到SQL编辑器中执行
   - 此脚本会创建临时表并填充CSV数据
   - 同时会引用`import_recipes.sql`执行实际导入逻辑

如果您看到错误"无法找到导入脚本"，请执行以下操作：
1. 先执行`generated_inserts.sql`内容(不包括最后一行的`\i ./import_recipes.sql`)
2. 然后单独复制并执行`import_recipes.sql`的内容

### 3. 验证导入结果

导入完成后，可以运行以下查询验证导入结果：

```sql
-- 查看新增系统食材数量
SELECT COUNT(*) FROM ingredients WHERE user_id = '00000000-0000-0000-0000-000000000000';

-- 查看菜谱总数
SELECT COUNT(*) FROM recipes;

-- 检查最新导入的菜谱
SELECT name, created_at FROM recipes ORDER BY created_at DESC LIMIT 20;
```

### 4. 故障排除

如果导入过程中遇到错误，常见问题及解决方案：

- **权限错误**：确保您使用的数据库账号有足够的权限执行导入
- **临时表已存在**：脚本开始会尝试清空临时表，如仍有问题，可手动执行：
  ```sql
  DROP TABLE IF EXISTS imported_ingredients, imported_recipes, imported_recipe_items;
  ```
- **数据类型错误**：检查CSV数据格式，特别是数字字段
- **唯一键冲突**：脚本设计会跳过已存在的食材和菜谱，但如有问题，可检查是否有重复数据

### 5. 自定义导入

如需调整导入逻辑，可修改以下文件：

- `scripts/convert_csv_to_sql.js` - 修改CSV到SQL的转换逻辑
- `import_recipes.sql` - 修改数据导入到实际表的逻辑

## 其他有用的SQL命令

```sql
-- 清空菜谱相关表(谨慎使用)
TRUNCATE TABLE recipe_ingredients, recipe_tags, recipe_steps, recipes CASCADE;

-- 重置所有用户的食材库存
UPDATE ingredients SET amount = 0 WHERE user_id != '00000000-0000-0000-0000-000000000000';

-- 查看用户库存食材
SELECT i.name, i.amount, i.unit, c.name as category 
FROM ingredients i
JOIN ingredient_categories c ON i.category_id = c.id
WHERE i.user_id = '用户UUID';
``` 