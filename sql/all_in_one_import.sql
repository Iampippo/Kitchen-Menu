-- 一体化导入脚本
-- 此脚本按顺序执行所有导入操作:
-- 1. 设置系统用户和食材分类
-- 2. 导入食材库存
-- 3. 导入菜谱
-- 4. 导入菜谱-食材关系

-- ============== 第一部分: 系统初始化 ==============

-- 确保系统用户和基础分类存在
INSERT INTO profiles (id, username)
VALUES 
('00000000-0000-0000-0000-000000000000', 'system') 
ON CONFLICT (id) DO NOTHING;

-- 创建食材分类（如果不存在）
INSERT INTO ingredient_categories (id, name)
VALUES 
(1, '蔬菜'),
(2, '肉类'),
(3, '调味料'),
(4, '粮食'),
(5, '其他'),
(6, '工具')
ON CONFLICT (id) DO NOTHING;

-- ============== 第二部分: 导入食材库存 ==============

-- 创建临时表
CREATE TEMP TABLE IF NOT EXISTS temp_ingredients (
  name text,
  type text,
  default_unit text,
  category text,
  note text
);

-- 插入库存材料数据
INSERT INTO temp_ingredients (name, type, default_unit, category, note) VALUES
('Tomato', 'ingredient', 'pcs', 'veg', ''),
('Potato', 'ingredient', 'pcs', 'veg', ''),
('Carrot', 'ingredient', 'pcs', 'veg', ''),
('Brown onion', 'ingredient', 'pcs', 'veg', ''),
('Garlic clove', 'ingredient', 'pcs', 'veg', ''),
('Ginger', 'ingredient', 'pcs', 'veg', ''),
('Baby spinach', 'ingredient', 'grams', 'veg', ''),
('Broccoli floret', 'ingredient', 'grams', 'veg', ''),
('Chicken thigh', 'ingredient', 'grams', 'meat', ''),
('Pork belly', 'ingredient', 'grams', 'meat', ''),
('Beef mince', 'ingredient', 'grams', 'meat', ''),
('Bacon rasher', 'ingredient', 'grams', 'meat', ''),
('Egg', 'ingredient', 'pcs', 'other', ''),
('Milk', 'ingredient', 'ml', 'other', ''),
('Cheddar cheese', 'ingredient', 'grams', 'other', ''),
('Butter unsalted', 'ingredient', 'grams', 'other', ''),
('Olive oil', 'seasoning', 'ml', 'seasoning', ''),
('Vegetable oil', 'seasoning', 'ml', 'seasoning', ''),
('Light soy sauce', 'seasoning', 'ml', 'seasoning', ''),
('Dark soy sauce', 'seasoning', 'ml', 'seasoning', ''),
('Oyster sauce', 'seasoning', 'ml', 'seasoning', ''),
('Doubanjiang', 'seasoning', 'grams', 'seasoning', ''),
('Ketchup', 'seasoning', 'ml', 'seasoning', ''),
('BBQ sauce', 'seasoning', 'ml', 'seasoning', ''),
('Salt', 'seasoning', 'grams', 'seasoning', ''),
('White pepper', 'seasoning', 'grams', 'seasoning', ''),
('Sugar', 'seasoning', 'grams', 'seasoning', ''),
('Corn starch', 'seasoning', 'grams', 'seasoning', ''),
('Long-grain rice', 'ingredient', 'grams', 'staple', ''),
('Jasmine rice', 'ingredient', 'grams', 'staple', ''),
('Spaghetti', 'ingredient', 'grams', 'staple', ''),
('Penne pasta', 'ingredient', 'grams', 'staple', ''),
('Tortilla wrap', 'ingredient', 'pcs', 'staple', ''),
('Flour plain', 'ingredient', 'grams', 'staple', ''),
('Rolled oats', 'ingredient', 'grams', 'staple', ''),
('Bao bun', 'ingredient', 'pcs', 'staple', ''),
('Instant ramen block', 'ingredient', 'pcs', 'staple', ''),
('Fresh udon', 'ingredient', 'grams', 'staple', ''),
('Frozen puff pastry', 'ingredient', 'grams', 'staple', ''),
('Sesame oil', 'seasoning', 'ml', 'seasoning', ''),
('Vinegar white', 'seasoning', 'ml', 'seasoning', ''),
('Vinegar black', 'seasoning', 'ml', 'seasoning', ''),
('Chilli flakes', 'seasoning', 'grams', 'seasoning', ''),
('Curry powder', 'seasoning', 'grams', 'seasoning', ''),
('Five-spice powder', 'seasoning', 'grams', 'seasoning', ''),
('Italian herb mix', 'seasoning', 'grams', 'seasoning', ''),
('Honey', 'seasoning', 'ml', 'seasoning', ''),
('Maple syrup', 'seasoning', 'ml', 'seasoning', ''),
('Chicken stock cube', 'seasoning', 'pcs', 'seasoning', ''),
('Parsley dried', 'seasoning', 'grams', 'seasoning', ''),
('Basil fresh', 'seasoning', 'grams', 'seasoning', ''),
('Lemon', 'ingredient', 'pcs', 'other', ''),
('Lime', 'ingredient', 'pcs', 'other', ''),
('Orange', 'ingredient', 'pcs', 'other', ''),
('Avocado', 'ingredient', 'pcs', 'other', ''),
('Mushroom button', 'ingredient', 'grams', 'veg', ''),
('Zucchini', 'ingredient', 'pcs', 'veg', ''),
('Capsicum red', 'ingredient', 'pcs', 'veg', ''),
('Snow peas', 'ingredient', 'grams', 'veg', ''),
('Calamari rings', 'ingredient', 'grams', 'meat', ''),
('Salmon fillet', 'ingredient', 'grams', 'meat', ''),
('Prawn raw', 'ingredient', 'grams', 'meat', ''),
('Bread slice', 'ingredient', 'pcs', 'staple', ''),
('Hash brown', 'ingredient', 'pcs', 'staple', ''),
('Wok', 'tool', 'pcs', 'tool', ''),
('Saucepan', 'tool', 'pcs', 'tool', ''),
('Frying pan', 'tool', 'pcs', 'tool', ''),
('Baking tray', 'tool', 'pcs', 'tool', ''),
('Rice cooker', 'tool', 'pcs', 'tool', ''),
('Air-fryer', 'tool', 'pcs', 'tool', ''),
('Chef knife', 'tool', 'pcs', 'tool', ''),
('Cutting board', 'tool', 'pcs', 'tool', ''),
('Coconut milk canned', 'ingredient', 'ml', 'other', ''),
('Sausage', 'ingredient', 'grams', 'meat', '')
;

-- 导入库存材料
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  temp_record RECORD;
  ingredient_id uuid;
  category_id bigint;
  ing_count integer := 0;
BEGIN
  RAISE NOTICE '===== 导入食材库存 =====';
  
  -- 确保系统用户存在
  IF NOT EXISTS (SELECT 1 FROM profiles WHERE id = system_user_id) THEN
    RAISE NOTICE '系统用户不存在，无法继续';
    RETURN;
  END IF;
  
  -- 遍历临时表中的材料数据
  FOR temp_record IN SELECT * FROM temp_ingredients LOOP
    -- 获取对应的分类ID
    SELECT id INTO category_id FROM ingredient_categories 
    WHERE name = CASE 
      WHEN temp_record.category = 'veg' THEN '蔬菜'
      WHEN temp_record.category = 'meat' THEN '肉类'
      WHEN temp_record.category = 'seasoning' THEN '调味料'
      WHEN temp_record.category = 'staple' THEN '粮食'
      WHEN temp_record.category = 'tool' THEN '工具'
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
    
    -- 检查材料是否已存在
    IF NOT EXISTS (
      SELECT 1 FROM ingredients 
      WHERE name = temp_record.name
      AND user_id = system_user_id
    ) THEN
      -- 插入新材料
      INSERT INTO ingredients (
        id, name, color, amount, unit, category_id, user_id
      ) VALUES (
        ingredient_id,
        temp_record.name,
        CASE 
          WHEN temp_record.category = 'veg' THEN 'bg-green-400'
          WHEN temp_record.category = 'meat' THEN 'bg-red-400'
          WHEN temp_record.category = 'seasoning' THEN 'bg-amber-400'
          WHEN temp_record.category = 'staple' THEN 'bg-yellow-400'
          WHEN temp_record.category = 'tool' THEN 'bg-blue-400'
          ELSE 'bg-gray-400'
        END,
        500, -- 默认数量
        temp_record.default_unit,
        category_id,
        system_user_id
      );
      ing_count := ing_count + 1;
    END IF;
  END LOOP;
  
  RAISE NOTICE '成功导入 % 种材料到库存', ing_count;
END $$;

-- ============== 第三部分: 导入菜谱 ==============

-- 创建临时表
CREATE TEMP TABLE IF NOT EXISTS temp_recipes (
  title text,
  description text,
  cuisine text,
  difficulty integer,
  est_minutes integer
);

-- 插入菜谱数据到临时表
INSERT INTO temp_recipes (title, description, cuisine, difficulty, est_minutes) VALUES
('番茄炒鸡蛋', '经典留学生快手菜，10分钟搞定，营养又下饭。', 'Chinese', 1, 15),
('蚝油生菜', '只需一口热锅和蚝油，就能做出脆嫩爽口的生菜。', 'Chinese', 1, 12),
('土豆咖喱鸡', '咖喱粉搭配椰奶，浓郁下饭的家常版咖喱鸡。', 'Chinese', 2, 35),
('酱爆茄子', '茄子吸足酱香，配米饭绝配。', 'Chinese', 2, 25),
('回锅肉', '澳洲超市五花肉也能炒出地道川味回锅肉。', 'Chinese', 3, 40),
('红烧牛腩面', '用高压锅炖牛腩，香浓汤底配拉面。', 'Chinese', 3, 60),
('Spaghetti Bolognese', '经典意式肉酱面，番茄与牛肉的完美结合。', 'Western', 1, 25),
('Creamy Mushroom Pasta', '奶油蘑菇酱浓郁顺滑，20分钟即可上桌。', 'Western', 1, 20),
('Chicken Quesadilla', '墨西哥风味鸡肉芝士夹饼，平底锅快速完成。', 'Western', 2, 18),
('Avocado Toast', '牛油果吐司配上溏心蛋，营养早餐首选。', 'Western', 1, 10),
('Garlic Butter Salmon', '黄油蒜香三文鱼，烤箱 15 分钟完成。', 'Western', 2, 25),
('One-Pan Sausage & Veg', '香肠蔬菜一盘烤，懒人晚餐不洗锅。', 'Western', 2, 30);

-- 导入菜谱数据
DO $$
DECLARE
  temp_record RECORD;
  new_recipe_id uuid;
  recipe_count integer := 0;
BEGIN
  RAISE NOTICE '===== 导入菜谱 =====';
  
  -- 遍历临时表中的菜谱数据
  FOR temp_record IN SELECT * FROM temp_recipes LOOP
    -- 检查菜谱是否已存在
    IF NOT EXISTS (
      SELECT 1 FROM recipes 
      WHERE name = temp_record.title
    ) THEN
      -- 生成新的UUID
      SELECT gen_random_uuid() INTO new_recipe_id;
      
      -- 插入新菜谱
      INSERT INTO recipes (
        id, name, weight, prep_time, cook_time, total_time, storage, difficulty, 
        calories, protein, fat, carbs, vitamins, minerals, favorite, rating, 
        review_count, image, description
      ) VALUES (
        new_recipe_id,
        temp_record.title,
        '300g', -- 默认值
        (temp_record.est_minutes / 3)::text || '分钟', -- 估算准备时间
        (temp_record.est_minutes * 2 / 3)::text || '分钟', -- 估算烹饪时间
        temp_record.est_minutes::text || '分钟',
        '冷藏1天', -- 默认值
        CASE 
          WHEN temp_record.difficulty = 1 THEN '简单'
          WHEN temp_record.difficulty = 2 THEN '较简单'
          WHEN temp_record.difficulty = 3 THEN '中等'
          WHEN temp_record.difficulty = 4 THEN '较难'
          ELSE '中等'
        END,
        NULL, NULL, NULL, NULL, NULL, NULL, -- 默认营养成分为空
        false, -- 默认不是收藏
        4.5, -- 默认评分
        0, -- 默认评价数
        lower(replace(replace(temp_record.title, ' ', '-'), '‑', '-')), -- 默认图片名
        temp_record.description -- 使用介绍作为描述
      );
      
      -- 插入菜谱标签
      INSERT INTO recipe_tags (recipe_id, tag) VALUES
      (new_recipe_id, temp_record.cuisine),
      (new_recipe_id, CASE 
        WHEN temp_record.difficulty <= 2 THEN '简单料理'
        WHEN temp_record.difficulty = 3 THEN '进阶料理'
        ELSE '高级料理'
      END);
      
      -- 如果是特定菜系，添加额外标签
      IF temp_record.cuisine = 'Chinese' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES (new_recipe_id, '中式料理');
      ELSIF temp_record.cuisine = 'Western' THEN
        INSERT INTO recipe_tags (recipe_id, tag) VALUES (new_recipe_id, '西式料理');
      END IF;
      
      -- 插入一个默认步骤
      INSERT INTO recipe_steps (recipe_id, step_number, description, time)
      VALUES (new_recipe_id, 1, '按照菜谱准备食材并烹饪', temp_record.est_minutes::text || '分钟');
      
      recipe_count := recipe_count + 1;
    END IF;
  END LOOP;
  
  RAISE NOTICE '成功导入 % 个菜谱', recipe_count;
END $$;

-- ============== 第四部分: 导入菜谱-食材关系 ==============

-- 创建临时表
CREATE TEMP TABLE IF NOT EXISTS temp_recipe_items (
  recipe_title text,
  item_name text,
  qty text,
  unit text
);

-- 插入菜谱食材关系数据
INSERT INTO temp_recipe_items (recipe_title, item_name, qty, unit) VALUES
('番茄炒鸡蛋', 'Tomato', '2', 'pcs'),
('番茄炒鸡蛋', 'Egg', '3', 'pcs'),
('番茄炒鸡蛋', 'Salt', '2', 'grams'),
('番茄炒鸡蛋', 'White pepper', '1', 'grams'),
('番茄炒鸡蛋', 'Vegetable oil', '10', 'ml'),
('蚝油生菜', 'Baby spinach', '150', 'grams'),
('蚝油生菜', 'Oyster sauce', '15', 'ml'),
('蚝油生菜', 'Garlic clove', '2', 'pcs'),
('蚝油生菜', 'Olive oil', '10', 'ml'),
('土豆咖喱鸡', 'Potato', '2', 'pcs'),
('土豆咖喱鸡', 'Chicken thigh', '300', 'grams'),
('土豆咖喱鸡', 'Curry powder', '8', 'grams'),
('土豆咖喱鸡', 'Light soy sauce', '10', 'ml'),
('土豆咖喱鸡', 'Coconut milk canned', '200', 'ml'),
('酱爆茄子', 'Zucchini', '1', 'pcs'),
('酱爆茄子', 'Garlic clove', '2', 'pcs'),
('酱爆茄子', 'Dark soy sauce', '10', 'ml'),
('酱爆茄子', 'Vegetable oil', '15', 'ml'),
('回锅肉', 'Pork belly', '250', 'grams'),
('回锅肉', 'Doubanjiang', '15', 'grams'),
('回锅肉', 'Light soy sauce', '10', 'ml'),
('回锅肉', 'Capsicum red', '1', 'pcs'),
('回锅肉', 'White pepper', '2', 'grams'),
('红烧牛腩面', 'Beef mince', '400', 'grams'),
('红烧牛腩面', 'Dark soy sauce', '15', 'ml'),
('红烧牛腩面', 'Long-grain rice', '100', 'grams'),
('红烧牛腩面', 'Carrot', '1', 'pcs'),
('红烧牛腩面', 'Chicken stock cube', '1', 'pcs'),
('Spaghetti Bolognese', 'Spaghetti', '180', 'grams'),
('Spaghetti Bolognese', 'Tomato', '3', 'pcs'),
('Spaghetti Bolognese', 'Beef mince', '250', 'grams'),
('Spaghetti Bolognese', 'Brown onion', '1', 'pcs'),
('Spaghetti Bolognese', 'Italian herb mix', '5', 'grams'),
('Creamy Mushroom Pasta', 'Penne pasta', '160', 'grams'),
('Creamy Mushroom Pasta', 'Mushroom button', '120', 'grams'),
('Creamy Mushroom Pasta', 'Milk', '100', 'ml'),
('Creamy Mushroom Pasta', 'Butter unsalted', '20', 'grams'),
('Chicken Quesadilla', 'Tortilla wrap', '2', 'pcs'),
('Chicken Quesadilla', 'Chicken thigh', '150', 'grams'),
('Chicken Quesadilla', 'Cheddar cheese', '80', 'grams'),
('Chicken Quesadilla', 'BBQ sauce', '15', 'ml'),
('Avocado Toast', 'Bread slice', '2', 'pcs'),
('Avocado Toast', 'Avocado', '1', 'pcs'),
('Avocado Toast', 'Egg', '1', 'pcs'),
('Avocado Toast', 'Salt', '2', 'grams'),
('Garlic Butter Salmon', 'Salmon fillet', '200', 'grams'),
('Garlic Butter Salmon', 'Butter unsalted', '15', 'grams'),
('Garlic Butter Salmon', 'Garlic clove', '2', 'pcs'),
('One-Pan Sausage & Veg', 'Sausage', '200', 'grams'),
('One-Pan Sausage & Veg', 'Potato', '1', 'pcs'),
('One-Pan Sausage & Veg', 'Broccoli floret', '120', 'grams'),
('One-Pan Sausage & Veg', 'Olive oil', '20', 'ml');

-- 导入菜谱与食材的关系
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  item_record RECORD;
  v_recipe_id uuid;
  v_ingredient_id uuid;
  v_ingredient_name text;
  relation_count integer := 0;
  missing_ingredients text := '';
  missing_recipes text := '';
BEGIN
  RAISE NOTICE '===== 导入菜谱-食材关系 =====';
  
  -- 遍历临时表中的菜谱食材关系
  FOR item_record IN SELECT * FROM temp_recipe_items LOOP
    -- 获取对应的菜谱ID
    SELECT id INTO v_recipe_id FROM recipes WHERE name = item_record.recipe_title LIMIT 1;
    
    -- 获取对应的食材ID和名称
    SELECT id, name INTO v_ingredient_id, v_ingredient_name 
    FROM ingredients 
    WHERE name = item_record.item_name 
    AND user_id = system_user_id
    LIMIT 1;
    
    -- 如果找不到对应食材，记录下来
    IF v_ingredient_id IS NULL THEN
      missing_ingredients := missing_ingredients || item_record.item_name || ', ';
      CONTINUE;
    END IF;
    
    -- 如果找不到对应菜谱，记录下来
    IF v_recipe_id IS NULL THEN
      missing_recipes := missing_recipes || item_record.recipe_title || ', ';
      CONTINUE;
    END IF;
    
    -- 检查此关系是否已存在
    IF NOT EXISTS (
      SELECT 1 FROM recipe_ingredients ri
      WHERE ri.recipe_id = v_recipe_id AND ri.ingredient_name = v_ingredient_name
    ) THEN
      -- 插入新的菜谱-食材关系
      INSERT INTO recipe_ingredients (recipe_id, ingredient_name)
      VALUES (v_recipe_id, v_ingredient_name);
      
      relation_count := relation_count + 1;
    END IF;
  END LOOP;
  
  RAISE NOTICE '成功导入 % 条菜谱-食材关系', relation_count;
  
  -- 输出missing信息
  IF length(missing_ingredients) > 0 THEN
    RAISE NOTICE '未找到以下食材: %', missing_ingredients;
  END IF;
  
  IF length(missing_recipes) > 0 THEN
    RAISE NOTICE '未找到以下菜谱: %', missing_recipes;
  END IF;
END $$;

-- ============== 第五部分: 检查导入结果 ==============

-- 1. 检查食材分类和库存
SELECT ic.name AS category, COUNT(i.*) AS count
FROM ingredients i
JOIN ingredient_categories ic ON i.category_id = ic.id
WHERE i.user_id = '00000000-0000-0000-0000-000000000000'
GROUP BY ic.name
ORDER BY ic.name;

-- 2. 检查菜谱和标签
SELECT r.name, r.difficulty, COUNT(rt.tag) AS tag_count
FROM recipes r
LEFT JOIN recipe_tags rt ON r.id = rt.recipe_id
GROUP BY r.name, r.difficulty
ORDER BY r.name;

-- 3. 检查菜谱-食材关系
SELECT r.name AS recipe_name, COUNT(ri.*) AS ingredient_count
FROM recipes r
LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
GROUP BY r.name
ORDER BY ingredient_count DESC;

-- 导入完成提示
DO $$
BEGIN
  RAISE NOTICE '===== 导入程序执行完毕 =====';
  RAISE NOTICE '请检查以上结果，确认数据是否正确导入';
END $$; 