-- 检查数据库表结构和导入过程

-- 获取表结构
SELECT EXISTS (
  SELECT 1 
  FROM information_schema.tables 
  WHERE table_schema = 'public' 
  AND table_name = 'ingredients'
) AS ingredients_exists;

SELECT EXISTS (
  SELECT 1 
  FROM information_schema.tables 
  WHERE table_schema = 'public' 
  AND table_name = 'recipes'
) AS recipes_exists;

SELECT EXISTS (
  SELECT 1 
  FROM information_schema.tables 
  WHERE table_schema = 'public' 
  AND table_name = 'recipe_ingredients'
) AS recipe_ingredients_exists;

-- 检查临时表是否有数据
SELECT EXISTS (
  SELECT 1 
  FROM pg_temp.imported_ingredients
  LIMIT 1
) AS temp_ingredients_has_data;

SELECT EXISTS (
  SELECT 1 
  FROM pg_temp.imported_recipes
  LIMIT 1
) AS temp_recipes_has_data;

SELECT EXISTS (
  SELECT 1 
  FROM pg_temp.imported_recipe_items
  LIMIT 1
) AS temp_recipe_items_has_data;

-- 查看一些从临时表中的数据样本
SELECT * FROM pg_temp.imported_ingredients LIMIT 5;
SELECT * FROM pg_temp.imported_recipes LIMIT 5;
SELECT * FROM pg_temp.imported_recipe_items LIMIT 5;

-- 检查系统用户ID是否存在
SELECT EXISTS (
  SELECT 1 
  FROM ingredients 
  WHERE user_id = '00000000-0000-0000-0000-000000000000'
) AS system_user_exists;

-- 获取ingredient_categories表中的分类
SELECT * FROM ingredient_categories; 