-- 简化版导入脚本，用于测试核心临时表逻辑

-- 1. 清理可能存在的旧表 (用于测试)
DROP TABLE IF EXISTS direct_test_ingredients;
DROP TABLE IF EXISTS direct_test_recipes;

-- 2. 创建目标表 (简化版，仅包含必要字段)
CREATE TABLE direct_test_ingredients (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text,
  user_id uuid
);
CREATE TABLE direct_test_recipes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text
);

-- 3. 创建临时表
CREATE TEMP TABLE IF NOT EXISTS temp_test_ingredients (
  name text
);
CREATE TEMP TABLE IF NOT EXISTS temp_test_recipes (
  title text
);

-- 4. 向临时表插入少量固定数据
INSERT INTO temp_test_ingredients (name) VALUES ('Test Ingredient 1'), ('Test Ingredient 2');
INSERT INTO temp_test_recipes (title) VALUES ('Test Recipe A'), ('Test Recipe B');

-- 5. 从临时表读取数据并插入主测试表
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  ing_record RECORD;
  recipe_record RECORD;
BEGIN
  RAISE NOTICE 'Starting DO block for direct_test_ingredients...';
  FOR ing_record IN SELECT name FROM temp_test_ingredients LOOP
    RAISE NOTICE 'Inserting ingredient: %', ing_record.name;
    INSERT INTO direct_test_ingredients (name, user_id) 
    VALUES ('CSV_SIMPLIFIED_' || ing_record.name, system_user_id);
  END LOOP;
  RAISE NOTICE 'Finished direct_test_ingredients.';

  RAISE NOTICE 'Starting DO block for direct_test_recipes...';
  FOR recipe_record IN SELECT title FROM temp_test_recipes LOOP
    RAISE NOTICE 'Inserting recipe: %', recipe_record.title;
    INSERT INTO direct_test_recipes (name) 
    VALUES ('CSV_SIMPLIFIED_' || recipe_record.title);
  END LOOP;
  RAISE NOTICE 'Finished direct_test_recipes.';
END $$;

-- 6. 查询结果
SELECT 'direct_test_ingredients' AS table_name, COUNT(*) FROM direct_test_ingredients;
SELECT 'direct_test_recipes' AS table_name, COUNT(*) FROM direct_test_recipes;

-- 7. 清理临时表 (可选, 会话结束时自动清理)
DROP TABLE IF EXISTS temp_test_ingredients;
DROP TABLE IF EXISTS temp_test_recipes; 