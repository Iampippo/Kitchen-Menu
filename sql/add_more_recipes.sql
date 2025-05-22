-- 添加更多菜谱的SQL脚本

-- 创建临时表存储新菜谱
CREATE TEMP TABLE IF NOT EXISTS temp_new_recipes (
  title text,
  description text,
  cuisine text,
  difficulty integer,
  est_minutes integer
);

-- 插入新菜谱数据
INSERT INTO temp_new_recipes (title, description, cuisine, difficulty, est_minutes) VALUES
('宫保鸡丁', '经典川菜，鸡肉与花生的完美结合，麻辣爽口。', 'Chinese', 2, 30),
('水煮鱼', '四川名菜，鲜嫩的鱼片配以麻辣汤底，层次丰富。', 'Chinese', 3, 45),
('糖醋排骨', '色泽红亮，酸甜可口，肉质酥烂的家常菜。', 'Chinese', 2, 40),
('麻婆豆腐', '麻辣鲜香，豆腐嫩滑，肉末入味，下饭首选。', 'Chinese', 2, 25),
('蒜蓉蒸虾', '蒜香浓郁，虾肉鲜嫩，清淡又营养的海鲜菜。', 'Chinese', 3, 25),
('清蒸鲈鱼', '保留鱼肉原汁原味，肉质细嫩的美味鱼菜。', 'Chinese', 2, 30),
('鱼香肉丝', '没有鱼却有鱼的香味，酸甜辣俱全的经典川菜。', 'Chinese', 3, 35),
('葱爆羊肉', '羊肉与大葱完美结合，去膻增香，肉质鲜嫩。', 'Chinese', 3, 30),
('红烧狮子头', '大块肉丸软烂多汁，红烧香浓，经典年菜。', 'Chinese', 3, 60),
('蒜香排骨', '排骨酥嫩多汁，蒜香浓郁，一口接一口。', 'Chinese', 2, 45),
('XO酱炒西兰花', '海鲜XO酱提鲜增香，西兰花爽脆可口。', 'Chinese', 1, 20),
('醋溜白菜', '酸辣开胃，脆嫩爽口，简单快手的家常小菜。', 'Chinese', 1, 15),
('Beef Stroganoff', '俄罗斯经典牛肉炖菜，配以酸奶油和蘑菇。', 'Western', 3, 45),
('Quiche Lorraine', '法式咸派，香浓的奶酪与培根完美结合。', 'Western', 3, 60),
('Grilled Cheese Sandwich', '简单美味的芝士三明治，外酥里嫩。', 'Western', 1, 15),
('Pesto Pasta with Shrimp', '罗勒青酱意面配鲜嫩虾仁，鲜香满溢。', 'Western', 2, 30),
('Roast Chicken', '香草烤鸡，皮脆肉嫩，家庭聚餐首选。', 'Western', 2, 75),
('Stuffed Bell Peppers', '肉末饭粒填充甜椒，烤至香软可口。', 'Western', 2, 45);

-- 创建临时表存储新菜谱-食材关系
CREATE TEMP TABLE IF NOT EXISTS temp_new_recipe_items (
  recipe_title text,
  item_name text
);

-- 插入新菜谱-食材关系
INSERT INTO temp_new_recipe_items (recipe_title, item_name) VALUES
('宫保鸡丁', 'Chicken thigh'),
('宫保鸡丁', 'Brown onion'),
('宫保鸡丁', 'Capsicum red'),
('宫保鸡丁', 'Soy sauce'),
('宫保鸡丁', 'Vinegar black'),
('宫保鸡丁', 'Chilli flakes'),

('水煮鱼', 'Salmon fillet'),
('水煮鱼', 'Doubanjiang'),
('水煮鱼', 'Chilli flakes'),
('水煮鱼', 'Ginger'),
('水煮鱼', 'Garlic clove'),

('糖醋排骨', 'Pork belly'),
('糖醋排骨', 'Vinegar black'),
('糖醋排骨', 'Sugar'),
('糖醋排骨', 'Tomato'),
('糖醋排骨', 'Soy sauce'),

('麻婆豆腐', 'Egg'),
('麻婆豆腐', 'Doubanjiang'),
('麻婆豆腐', 'Garlic clove'),
('麻婆豆腐', 'Chilli flakes'),
('麻婆豆腐', 'Soy sauce'),

('蒜蓉蒸虾', 'Prawn raw'),
('蒜蓉蒸虾', 'Garlic clove'),
('蒜蓉蒸虾', 'Ginger'),
('蒜蓉蒸虾', 'Olive oil'),

('清蒸鲈鱼', 'Salmon fillet'),
('清蒸鲈鱼', 'Ginger'),
('清蒸鲈鱼', 'Garlic clove'),
('清蒸鲈鱼', 'Soy sauce'),
('清蒸鲈鱼', 'Sesame oil'),

('鱼香肉丝', 'Pork belly'),
('鱼香肉丝', 'Carrot'),
('鱼香肉丝', 'Sugar'),
('鱼香肉丝', 'Vinegar black'),
('鱼香肉丝', 'Soy sauce'),
('鱼香肉丝', 'Doubanjiang'),

('葱爆羊肉', 'Beef mince'),
('葱爆羊肉', 'Brown onion'),
('葱爆羊肉', 'Ginger'),
('葱爆羊肉', 'Soy sauce'),
('葱爆羊肉', 'Sesame oil'),

('红烧狮子头', 'Beef mince'),
('红烧狮子头', 'Egg'),
('红烧狮子头', 'Carrot'),
('红烧狮子头', 'Soy sauce'),
('红烧狮子头', 'Brown onion'),

('蒜香排骨', 'Pork belly'),
('蒜香排骨', 'Garlic clove'),
('蒜香排骨', 'Soy sauce'),
('蒜香排骨', 'Sugar'),
('蒜香排骨', 'Salt'),

('XO酱炒西兰花', 'Broccoli floret'),
('XO酱炒西兰花', 'Garlic clove'),
('XO酱炒西兰花', 'Oyster sauce'),
('XO酱炒西兰花', 'Olive oil'),

('醋溜白菜', 'Baby spinach'),
('醋溜白菜', 'Vinegar white'),
('醋溜白菜', 'Garlic clove'),
('醋溜白菜', 'Chilli flakes'),
('醋溜白菜', 'Salt'),

('Beef Stroganoff', 'Beef mince'),
('Beef Stroganoff', 'Mushroom button'),
('Beef Stroganoff', 'Brown onion'),
('Beef Stroganoff', 'Milk'),
('Beef Stroganoff', 'Long-grain rice'),

('Quiche Lorraine', 'Egg'),
('Quiche Lorraine', 'Milk'),
('Quiche Lorraine', 'Cheddar cheese'),
('Quiche Lorraine', 'Bacon rasher'),
('Quiche Lorraine', 'Flour plain'),

('Grilled Cheese Sandwich', 'Bread slice'),
('Grilled Cheese Sandwich', 'Cheddar cheese'),
('Grilled Cheese Sandwich', 'Butter unsalted'),

('Pesto Pasta with Shrimp', 'Penne pasta'),
('Pesto Pasta with Shrimp', 'Prawn raw'),
('Pesto Pasta with Shrimp', 'Olive oil'),
('Pesto Pasta with Shrimp', 'Garlic clove'),
('Pesto Pasta with Shrimp', 'Basil fresh'),

('Roast Chicken', 'Chicken thigh'),
('Roast Chicken', 'Potato'),
('Roast Chicken', 'Carrot'),
('Roast Chicken', 'Olive oil'),
('Roast Chicken', 'Italian herb mix'),
('Roast Chicken', 'Lemon'),

('Stuffed Bell Peppers', 'Capsicum red'),
('Stuffed Bell Peppers', 'Beef mince'),
('Stuffed Bell Peppers', 'Long-grain rice'),
('Stuffed Bell Peppers', 'Brown onion'),
('Stuffed Bell Peppers', 'Cheddar cheese');

-- 导入新菜谱
DO $$
DECLARE
  temp_record RECORD;
  new_recipe_id uuid;
  recipe_count integer := 0;
BEGIN
  RAISE NOTICE '===== 导入新菜谱 =====';
  
  -- 遍历临时表中的菜谱数据
  FOR temp_record IN SELECT * FROM temp_new_recipes LOOP
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
  
  RAISE NOTICE '成功导入 % 个新菜谱', recipe_count;
END $$;

-- 导入新菜谱与食材的关系
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  item_record RECORD;
  v_recipe_id uuid;
  v_ingredient_name text;
  relation_count integer := 0;
  missing_ingredients text := '';
  missing_recipes text := '';
BEGIN
  RAISE NOTICE '===== 导入新菜谱-食材关系 =====';
  
  -- 遍历临时表中的菜谱食材关系
  FOR item_record IN SELECT * FROM temp_new_recipe_items LOOP
    -- 获取对应的菜谱ID
    SELECT id INTO v_recipe_id FROM recipes WHERE name = item_record.recipe_title LIMIT 1;
    
    -- 获取对应的食材名称
    SELECT name INTO v_ingredient_name 
    FROM ingredients 
    WHERE name = item_record.item_name
    AND user_id = system_user_id
    LIMIT 1;
    
    -- 如果找不到对应食材，记录下来
    IF v_ingredient_name IS NULL THEN
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
  
  RAISE NOTICE '成功导入 % 条新菜谱-食材关系', relation_count;
  
  -- 输出missing信息
  IF length(missing_ingredients) > 0 THEN
    RAISE NOTICE '未找到以下食材: %', missing_ingredients;
  END IF;
  
  IF length(missing_recipes) > 0 THEN
    RAISE NOTICE '未找到以下菜谱: %', missing_recipes;
  END IF;
END $$;

-- 检查导入后的菜谱数量
SELECT COUNT(*) AS total_recipes FROM recipes;

-- 检查每个菜谱的食材数量
SELECT r.name AS recipe_name, COUNT(ri.*) AS ingredient_count
FROM recipes r
LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
GROUP BY r.name
ORDER BY r.name; 