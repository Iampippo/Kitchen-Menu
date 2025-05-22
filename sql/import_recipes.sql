-- 从CSV导入新菜谱的SQL脚本

-- 1. 首先导入新的食材（如果有）
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  ingredient_name text;
  unit_value text;
  category_name text;
BEGIN
  -- 遍历CSV文件中的食材（这里假设已经将CSV文件导入到临时表中）
  FOR ingredient_name, unit_value, category_name IN 
    SELECT name, default_unit, category FROM imported_ingredients
  LOOP
    -- 检查食材是否已存在
    IF NOT EXISTS (SELECT 1 FROM ingredients WHERE name = ingredient_name AND user_id = system_user_id) THEN
      -- 插入新食材
      INSERT INTO ingredients (
        id, name, color, amount, unit, category_id, user_id
      ) VALUES (
        gen_random_uuid(),
        ingredient_name,
        -- 分配默认颜色，可以根据类别来定
        CASE 
          WHEN category_name = 'veg' THEN 'bg-green-400'
          WHEN category_name = 'meat' THEN 'bg-red-400'
          WHEN category_name = 'seasoning' THEN 'bg-amber-400'
          WHEN category_name = 'staple' THEN 'bg-yellow-400'
          ELSE 'bg-gray-400'
        END,
        500, -- 默认数量
        unit_value,
        (SELECT id FROM ingredient_categories WHERE 
          CASE 
            WHEN category_name = 'veg' THEN name = '蔬菜'
            WHEN category_name = 'meat' THEN name = '肉类'
            WHEN category_name = 'seasoning' THEN name = '调味料'
            WHEN category_name = 'staple' THEN name = '粮食'
            ELSE name = '蔬菜' -- 默认分类
          END
        ),
        system_user_id
      );
    END IF;
  END LOOP;
END $$;

-- 2. 导入新菜谱
DO $$
DECLARE
  recipe_title text;
  recipe_intro text;
  recipe_cuisine text;
  recipe_difficulty integer;
  recipe_time integer;
  new_recipe_id uuid;
BEGIN
  -- 遍历CSV文件中的菜谱
  FOR recipe_title, recipe_intro, recipe_cuisine, recipe_difficulty, recipe_time IN 
    SELECT title, intro_md, cuisine, difficulty, est_minutes FROM imported_recipes
  LOOP
    -- 检查菜谱是否已存在（添加CSV标记避免重名）
    IF NOT EXISTS (SELECT 1 FROM recipes WHERE name = 'CSV_' || recipe_title) THEN
      -- 生成新的UUID
      SELECT gen_random_uuid() INTO new_recipe_id;
      
      -- 插入新菜谱基本信息
      INSERT INTO recipes (
        id, name, weight, prep_time, cook_time, total_time, 
        storage, difficulty, calories, protein, fat, carbs, 
        vitamins, minerals, favorite, rating, review_count, 
        image, description
      ) VALUES (
        new_recipe_id,
        'CSV_' || recipe_title,
        '300g', -- 默认值
        (recipe_time / 3)::text || '分钟', -- 估算准备时间
        (recipe_time * 2 / 3)::text || '分钟', -- 估算烹饪时间
        recipe_time::text || '分钟',
        '冷藏1天', -- 默认值
        CASE 
          WHEN recipe_difficulty = 1 THEN '简单'
          WHEN recipe_difficulty = 2 THEN '较简单'
          WHEN recipe_difficulty = 3 THEN '中等'
          WHEN recipe_difficulty = 4 THEN '较难'
          ELSE '中等'
        END,
        NULL, -- 默认卡路里为空
        NULL, -- 默认蛋白质为空
        NULL, -- 默认脂肪为空
        NULL, -- 默认碳水为空
        NULL, -- 默认维生素为空
        NULL, -- 默认矿物质为空
        false, -- 默认不是收藏
        4.5, -- 默认评分
        0, -- 默认评价数
        lower(replace(replace(recipe_title, ' ', '-'), '‑', '-')), -- 默认图片名
        recipe_intro -- 使用intro作为描述
      );
      
      -- 插入菜谱标签
      INSERT INTO recipe_tags (recipe_id, tag) VALUES
      (new_recipe_id, recipe_cuisine),
      (new_recipe_id, CASE 
        WHEN recipe_difficulty <= 2 THEN '简单料理'
        WHEN recipe_difficulty = 3 THEN '进阶料理'
        ELSE '高级料理'
      END);
      
      -- 如果是特定菜系，添加额外标签
      IF recipe_cuisine = 'Chinese' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES
        (new_recipe_id, '中式料理');
      ELSIF recipe_cuisine = 'Western' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES
        (new_recipe_id, '西式料理');
      ELSIF recipe_cuisine = 'Lazy' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES
        (new_recipe_id, '快手料理');
      END IF;
      
      -- 插入一个默认步骤
      INSERT INTO recipe_steps (recipe_id, step_number, description, time)
      VALUES (new_recipe_id, 1, '按照菜谱准备食材并烹饪', recipe_time::text || '分钟');
    END IF;
  END LOOP;
END $$;

-- 3. 导入菜谱与食材的关系
DO $$
DECLARE
  r_title text;
  i_name text;
  i_qty numeric;
  i_unit text;
  recipe_id uuid;
BEGIN
  -- 遍历CSV文件中的菜谱食材关系
  FOR r_title, i_name, i_qty, i_unit IN 
    SELECT recipe_title, item_name, qty::numeric, unit FROM imported_recipe_items
  LOOP
    -- 获取对应的菜谱ID（带CSV前缀）
    SELECT id INTO recipe_id FROM recipes WHERE name = 'CSV_' || r_title LIMIT 1;
    
    -- 如果找到了对应菜谱
    IF recipe_id IS NOT NULL THEN
      -- 检查此食材是否已经添加到此菜谱
      IF NOT EXISTS (SELECT 1 FROM recipe_ingredients WHERE recipe_id = recipe_id AND ingredient_name = i_name) THEN
        -- 插入菜谱食材关系
        INSERT INTO recipe_ingredients (recipe_id, ingredient_name)
        VALUES (recipe_id, i_name);
      END IF;
    END IF;
  END LOOP;
END $$;

-- 4. 创建临时表用于导入CSV数据
-- 注意：实际使用时需要先创建这些临时表并导入CSV数据
-- 创建临时表用于导入食材CSV
CREATE TEMP TABLE IF NOT EXISTS imported_ingredients (
  name text,
  type text,
  default_unit text,
  category text,
  note_au text
);

-- 创建临时表用于导入菜谱CSV
CREATE TEMP TABLE IF NOT EXISTS imported_recipes (
  title text,
  intro_md text,
  cuisine text,
  difficulty integer,
  est_minutes integer
);

-- 创建临时表用于导入菜谱食材关系CSV
CREATE TEMP TABLE IF NOT EXISTS imported_recipe_items (
  recipe_title text,
  item_name text,
  qty text,
  unit text
);

-- 5. 导入CSV数据到临时表
-- 通常此部分需要用COPY命令或通过客户端程序导入
-- 由于在Supabase环境中可能没有直接访问文件系统的权限，可能需要通过API或其他方式导入

-- 示例（如果有文件系统访问权限）：
-- COPY imported_ingredients FROM '/path/to/01_ingredients_au.csv' WITH (FORMAT csv, HEADER true);
-- COPY imported_recipes FROM '/path/to/02_recipes_cn_west.csv' WITH (FORMAT csv, HEADER true);
-- COPY imported_recipe_items FROM '/path/to/03_recipe_items.csv' WITH (FORMAT csv, HEADER true);

-- 6. 清理临时表
-- DROP TABLE IF EXISTS imported_ingredients;
-- DROP TABLE IF EXISTS imported_recipes;
-- DROP TABLE IF EXISTS imported_recipe_items;

-- 检查系统食材数量
SELECT COUNT(*) FROM ingredients WHERE user_id = '00000000-0000-0000-0000-000000000000';

-- 检查菜谱总数
SELECT COUNT(*) FROM recipes;

-- 检查菜谱与食材关系数量
SELECT COUNT(*) FROM recipe_ingredients;

-- 查看最新导入的10个菜谱
SELECT name, created_at FROM recipes ORDER BY created_at DESC LIMIT 10; 