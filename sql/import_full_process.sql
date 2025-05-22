-- 完整菜谱数据导入流程
-- 此脚本按顺序执行所有必要步骤，确保数据正确导入

-- 步骤1: 创建系统用户和食材分类 (必要的前置条件)
DO $$
BEGIN
  RAISE NOTICE '===== 步骤1: 设置必要的基础数据 =====';
  
  -- 1.1 添加系统用户（如果不存在）
  INSERT INTO profiles (id, username, full_name)
  VALUES 
  ('00000000-0000-0000-0000-000000000000', 'system', 'System User') 
  ON CONFLICT (id) DO NOTHING;

  -- 1.2 创建或更新食材分类
  IF NOT EXISTS (SELECT 1 FROM ingredient_categories) THEN
    INSERT INTO ingredient_categories (id, name, color)
    VALUES 
    (gen_random_uuid(), '蔬菜', 'bg-green-400'),
    (gen_random_uuid(), '肉类', 'bg-red-400'),
    (gen_random_uuid(), '调味料', 'bg-amber-400'),
    (gen_random_uuid(), '粮食', 'bg-yellow-400'),
    (gen_random_uuid(), '其他', 'bg-gray-400'),
    (gen_random_uuid(), '工具', 'bg-gray-400')
    ON CONFLICT (name) DO UPDATE SET color = EXCLUDED.color;
    
    RAISE NOTICE '已创建基础食材分类';
  ELSE
    RAISE NOTICE '食材分类已存在，无需重新创建';
  END IF;
  
  -- 1.3 确认基础数据已设置
  RAISE NOTICE '系统用户和食材分类已设置完成';
END $$;

-- 步骤2: 创建临时表用于数据导入
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

-- 步骤3: 从CSV导入数据到临时表
-- 3.1 导入食材数据
COPY imported_ingredients (name, type, default_unit, category, note_au) FROM stdin WITH (FORMAT csv, HEADER true);
-- 这里将由convert_csv_to_sql.js插入实际的CSV内容
\.

-- 3.2 导入菜谱数据
COPY imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) FROM stdin WITH (FORMAT csv, HEADER true);
-- 这里将由convert_csv_to_sql.js插入实际的CSV内容
\.

-- 3.3 导入菜谱食材关系数据
COPY imported_recipe_items (recipe_title, item_name, qty, unit) FROM stdin WITH (FORMAT csv, HEADER true);
-- 这里将由convert_csv_to_sql.js插入实际的CSV内容
\.

-- 步骤4: 导入食材
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  ing_record RECORD;
  ingredient_id uuid;
  category_id uuid;
  ing_count integer := 0;
BEGIN
  RAISE NOTICE '===== 步骤4: 导入食材 =====';
  
  -- 确保系统用户存在
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = system_user_id) THEN
    RAISE NOTICE '系统用户不存在，无法继续';
    RETURN;
  END IF;
  
  -- 确保食材分类存在
  IF NOT EXISTS (SELECT 1 FROM ingredient_categories LIMIT 1) THEN
    RAISE NOTICE '食材分类不存在，无法继续';
    RETURN;
  END IF;
  
  -- 遍历导入的食材
  FOR ing_record IN SELECT * FROM imported_ingredients LOOP
    -- 获取对应的分类ID
    SELECT id INTO category_id FROM ingredient_categories 
    WHERE name = CASE 
      WHEN ing_record.category = 'veg' THEN '蔬菜'
      WHEN ing_record.category = 'meat' THEN '肉类'
      WHEN ing_record.category = 'seasoning' THEN '调味料'
      WHEN ing_record.category = 'staple' THEN '粮食'
      WHEN ing_record.category = 'tool' THEN '工具'
      ELSE '其他'
    END;
    
    -- 如果找不到分类，使用默认分类
    IF category_id IS NULL THEN
      SELECT id INTO category_id FROM ingredient_categories WHERE name = '其他';
      IF category_id IS NULL THEN
        SELECT id INTO category_id FROM ingredient_categories LIMIT 1;
      END IF;
    END IF;
    
    -- 生成新的UUID
    SELECT gen_random_uuid() INTO ingredient_id;
    
    -- 检查食材是否已存在（考虑带和不带CSV_前缀的情况）
    IF NOT EXISTS (
      SELECT 1 FROM ingredients 
      WHERE (name = 'CSV_' || ing_record.name OR name = ing_record.name) 
      AND user_id = system_user_id
    ) THEN
      -- 插入新食材，名称前加CSV_前缀避免冲突
      INSERT INTO ingredients (
        id, name, color, amount, unit, category_id, user_id
      ) VALUES (
        ingredient_id,
        'CSV_' || ing_record.name,
        CASE 
          WHEN ing_record.category = 'veg' THEN 'bg-green-400'
          WHEN ing_record.category = 'meat' THEN 'bg-red-400'
          WHEN ing_record.category = 'seasoning' THEN 'bg-amber-400'
          WHEN ing_record.category = 'staple' THEN 'bg-yellow-400'
          ELSE 'bg-gray-400'
        END,
        500, -- 默认数量
        ing_record.default_unit,
        category_id,
        system_user_id
      );
      ing_count := ing_count + 1;
    END IF;
  END LOOP;
  
  RAISE NOTICE '成功导入 % 种食材', ing_count;
END $$;

-- 步骤5: 导入菜谱
DO $$
DECLARE
  recipe_record RECORD;
  new_recipe_id uuid;
  recipe_count integer := 0;
BEGIN
  RAISE NOTICE '===== 步骤5: 导入菜谱 =====';
  
  -- 遍历导入的菜谱
  FOR recipe_record IN SELECT * FROM imported_recipes LOOP
    -- 检查菜谱是否已存在
    IF NOT EXISTS (
      SELECT 1 FROM recipes 
      WHERE name = 'CSV_' || recipe_record.title OR name = recipe_record.title
    ) THEN
      -- 生成新的UUID
      SELECT gen_random_uuid() INTO new_recipe_id;
      
      -- 插入新菜谱，名称前加CSV_前缀避免冲突
      INSERT INTO recipes (
        id, name, weight, prep_time, cook_time, total_time, storage, difficulty, 
        calories, protein, fat, carbs, vitamins, minerals, favorite, rating, 
        review_count, image, description
      ) VALUES (
        new_recipe_id,
        'CSV_' || recipe_record.title,
        '300g', -- 默认值
        (recipe_record.est_minutes / 3)::text || '分钟', -- 估算准备时间
        (recipe_record.est_minutes * 2 / 3)::text || '分钟', -- 估算烹饪时间
        recipe_record.est_minutes::text || '分钟',
        '冷藏1天', -- 默认值
        CASE 
          WHEN recipe_record.difficulty = 1 THEN '简单'
          WHEN recipe_record.difficulty = 2 THEN '较简单'
          WHEN recipe_record.difficulty = 3 THEN '中等'
          WHEN recipe_record.difficulty = 4 THEN '较难'
          ELSE '中等'
        END,
        NULL, NULL, NULL, NULL, NULL, NULL, -- 默认营养成分为空
        false, -- 默认不是收藏
        4.5, -- 默认评分
        0, -- 默认评价数
        lower(replace(replace(recipe_record.title, ' ', '-'), '‑', '-')), -- 默认图片名
        recipe_record.intro_md -- 使用intro作为描述
      );
      
      -- 插入菜谱标签
      INSERT INTO recipe_tags (recipe_id, tag) VALUES
      (new_recipe_id, recipe_record.cuisine),
      (new_recipe_id, CASE 
        WHEN recipe_record.difficulty <= 2 THEN '简单料理'
        WHEN recipe_record.difficulty = 3 THEN '进阶料理'
        ELSE '高级料理'
      END);
      
      -- 如果是特定菜系，添加额外标签
      IF recipe_record.cuisine = 'Chinese' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES (new_recipe_id, '中式料理');
      ELSIF recipe_record.cuisine = 'Western' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES (new_recipe_id, '西式料理');
      ELSIF recipe_record.cuisine = 'Lazy' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES (new_recipe_id, '快手料理');
      END IF;
      
      -- 插入一个默认步骤
      INSERT INTO recipe_steps (recipe_id, step_number, description, time)
      VALUES (new_recipe_id, 1, '按照菜谱准备食材并烹饪', recipe_record.est_minutes::text || '分钟');
      
      recipe_count := recipe_count + 1;
    END IF;
  END LOOP;
  
  RAISE NOTICE '成功导入 % 个菜谱', recipe_count;
END $$;

-- 步骤6: 导入菜谱食材关系
DO $$
DECLARE
  item_record RECORD;
  recipe_id uuid;
  recipe_title text;
  ingredient_name text;
  relation_count integer := 0;
BEGIN
  RAISE NOTICE '===== 步骤6: 导入菜谱食材关系 =====';
  
  -- 遍历导入的菜谱食材关系
  FOR item_record IN SELECT * FROM imported_recipe_items LOOP
    recipe_title := 'CSV_' || item_record.recipe_title;
    ingredient_name := 'CSV_' || item_record.item_name;
    
    -- 获取对应的菜谱ID（带CSV_前缀）
    SELECT id INTO recipe_id FROM recipes WHERE name = recipe_title LIMIT 1;
    
    -- 如果找到了对应菜谱
    IF recipe_id IS NOT NULL THEN
      -- 检查此关系是否已存在
      IF NOT EXISTS (
        SELECT 1 FROM recipe_ingredients 
        WHERE recipe_id = recipe_id AND ingredient_name = ingredient_name
      ) THEN
        -- 插入菜谱食材关系
        INSERT INTO recipe_ingredients (recipe_id, ingredient_name, quantity)
        VALUES (recipe_id, ingredient_name, item_record.qty || ' ' || item_record.unit);
        
        relation_count := relation_count + 1;
      END IF;
    ELSE
      RAISE NOTICE '找不到菜谱: %', recipe_title;
    END IF;
  END LOOP;
  
  RAISE NOTICE '成功导入 % 条菜谱食材关系', relation_count;
END $$;

-- 步骤7: 查看导入结果
DO $$
BEGIN
  RAISE NOTICE '===== 步骤7: 导入结果统计 =====';
END $$;

SELECT COUNT(*) AS imported_ingredients FROM ingredients WHERE name LIKE 'CSV_%';
SELECT COUNT(*) AS imported_recipes FROM recipes WHERE name LIKE 'CSV_%';
SELECT COUNT(*) AS imported_recipe_items FROM recipe_ingredients 
WHERE recipe_id IN (SELECT id FROM recipes WHERE name LIKE 'CSV_%');

-- 查看前10条导入的食材
SELECT id, name, unit, category_id FROM ingredients WHERE name LIKE 'CSV_%' LIMIT 10;

-- 查看前5条导入的菜谱
SELECT id, name, difficulty FROM recipes WHERE name LIKE 'CSV_%' LIMIT 5;

-- 查看前5条导入的菜谱食材关系
SELECT r.name as recipe_name, ri.ingredient_name, ri.quantity
FROM recipe_ingredients ri
JOIN recipes r ON ri.recipe_id = r.id
WHERE r.name LIKE 'CSV_%'
LIMIT 5;

-- 步骤8: 清理临时表
DROP TABLE IF EXISTS imported_ingredients;
DROP TABLE IF EXISTS imported_recipes;
DROP TABLE IF EXISTS imported_recipe_items;

RAISE NOTICE '===== 完成导入 ====='; 