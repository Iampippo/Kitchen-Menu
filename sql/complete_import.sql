-- 完整菜谱导入脚本
-- 此脚本将直接在Supabase控制台执行，包含所有必要步骤

-- 1. 首先创建系统用户和基础分类
INSERT INTO profiles (id, username, full_name)
VALUES 
('00000000-0000-0000-0000-000000000000', 'system', 'System User') 
ON CONFLICT (id) DO NOTHING;

-- 创建食材分类
INSERT INTO ingredient_categories (id, name, color)
VALUES 
(gen_random_uuid(), '蔬菜', 'bg-green-400'),
(gen_random_uuid(), '肉类', 'bg-red-400'),
(gen_random_uuid(), '调味料', 'bg-amber-400'),
(gen_random_uuid(), '粮食', 'bg-yellow-400'),
(gen_random_uuid(), '其他', 'bg-gray-400'),
(gen_random_uuid(), '工具', 'bg-gray-400')
ON CONFLICT (name) DO UPDATE SET color = EXCLUDED.color;

-- 2. 创建临时表用于数据导入
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

-- 3. 导入食材数据
COPY imported_ingredients (name, type, default_unit, category, note_au) FROM stdin WITH (FORMAT csv, HEADER false);
Tomato,ingredient,pcs,veg,
Potato,ingredient,pcs,veg,
Carrot,ingredient,pcs,veg,
Brown onion,ingredient,pcs,veg,
Garlic clove,ingredient,pcs,veg,
Ginger,ingredient,pcs,veg,
Baby spinach,ingredient,grams,veg,
Broccoli floret,ingredient,grams,veg,
Chicken thigh,ingredient,grams,meat,
Pork belly,ingredient,grams,meat,
Beef mince,ingredient,grams,meat,
Bacon rasher,ingredient,grams,meat,
Egg,ingredient,pcs,other,
Milk,ingredient,ml,other,
Cheddar cheese,ingredient,grams,other,
Butter unsalted,ingredient,grams,other,
Olive oil,seasoning,ml,seasoning,
Vegetable oil,seasoning,ml,seasoning,
Light soy sauce,seasoning,ml,seasoning,
Dark soy sauce,seasoning,ml,seasoning,
Oyster sauce,seasoning,ml,seasoning,
Doubanjiang,seasoning,grams,seasoning,
Ketchup,seasoning,ml,seasoning,
BBQ sauce,seasoning,ml,seasoning,
Salt,seasoning,grams,seasoning,
White pepper,seasoning,grams,seasoning,
Sugar,seasoning,grams,seasoning,
Corn starch,seasoning,grams,seasoning,
Long-grain rice,ingredient,grams,staple,
Jasmine rice,ingredient,grams,staple,
Spaghetti,ingredient,grams,staple,
Penne pasta,ingredient,grams,staple,
Tortilla wrap,ingredient,pcs,staple,
Flour plain,ingredient,grams,staple,
Rolled oats,ingredient,grams,staple,
Bao bun,ingredient,pcs,staple,
Instant ramen block,ingredient,pcs,staple,
Fresh udon,ingredient,grams,staple,
Frozen puff pastry,ingredient,grams,staple,
Sesame oil,seasoning,ml,seasoning,
Vinegar white,seasoning,ml,seasoning,
Vinegar black,seasoning,ml,seasoning,
Chilli flakes,seasoning,grams,seasoning,
Curry powder,seasoning,grams,seasoning,
Five-spice powder,seasoning,grams,seasoning,
Italian herb mix,seasoning,grams,seasoning,
Honey,seasoning,ml,seasoning,
Maple syrup,seasoning,ml,seasoning,
Chicken stock cube,seasoning,pcs,seasoning,
Parsley dried,seasoning,grams,seasoning,
Basil fresh,seasoning,grams,seasoning,
Lemon,ingredient,pcs,other,
Lime,ingredient,pcs,other,
Orange,ingredient,pcs,other,
Avocado,ingredient,pcs,other,
Mushroom button,ingredient,grams,veg,
Zucchini,ingredient,pcs,veg,
Capsicum red,ingredient,pcs,veg,
Snow peas,ingredient,grams,veg,
Calamari rings,ingredient,grams,meat,
Salmon fillet,ingredient,grams,meat,
Prawn raw,ingredient,grams,meat,
Bread slice,ingredient,pcs,staple,
Hash brown,ingredient,pcs,staple,
Wok,tool,pcs,tool,Kitchen utensil
Saucepan,tool,pcs,tool,
Frying pan,tool,pcs,tool,
Baking tray,tool,pcs,tool,
Rice cooker,tool,pcs,tool,
Air-fryer,tool,pcs,tool,
Chef knife,tool,pcs,tool,
Cutting board,tool,pcs,tool,Kitchen utensil
\.

-- 4. 导入菜谱数据
COPY imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) FROM stdin WITH (FORMAT csv, HEADER false);
番茄炒鸡蛋,"经典留学生快手菜，10分钟搞定，营养又下饭。",Chinese,1,15
蚝油生菜,"只需一口热锅和蚝油，就能做出脆嫩爽口的生菜。",Chinese,1,12
土豆咖喱鸡,"咖喱粉搭配椰奶，浓郁下饭的家常版咖喱鸡。",Chinese,2,35
酱爆茄子,"茄子吸足酱香，配米饭绝配。",Chinese,2,25
回锅肉,"澳洲超市五花肉也能炒出地道川味回锅肉。",Chinese,3,40
红烧牛腩面,"用高压锅炖牛腩，香浓汤底配拉面。",Chinese,3,60
Spaghetti Bolognese,"经典意式肉酱面，番茄与牛肉的完美结合。",Western,1,25
Creamy Mushroom Pasta,"奶油蘑菇酱浓郁顺滑，20分钟即可上桌。",Western,1,20
Chicken Quesadilla,"墨西哥风味鸡肉芝士夹饼，平底锅快速完成。",Western,2,18
Avocado Toast,"牛油果吐司配上溏心蛋，营养早餐首选。",Western,1,10
Garlic Butter Salmon,"黄油蒜香三文鱼，烤箱 15 分钟完成。",Western,2,25
One-Pan Sausage & Veg,"香肠蔬菜一盘烤，懒人晚餐不洗锅。",Western,2,30
\.

-- 5. 导入菜谱食材关系数据
COPY imported_recipe_items (recipe_title, item_name, qty, unit) FROM stdin WITH (FORMAT csv, HEADER false);
番茄炒鸡蛋,Tomato,2,pcs
番茄炒鸡蛋,Egg,3,pcs
番茄炒鸡蛋,Salt,2,grams
番茄炒鸡蛋,White pepper,1,grams
番茄炒鸡蛋,Vegetable oil,10,ml
蚝油生菜,Baby spinach,150,grams
蚝油生菜,Oyster sauce,15,ml
蚝油生菜,Garlic clove,2,pcs
蚝油生菜,Olive oil,10,ml
土豆咖喱鸡,Potato,2,pcs
土豆咖喱鸡,Chicken thigh,300,grams
土豆咖喱鸡,Curry powder,8,grams
土豆咖喱鸡,Light soy sauce,10,ml
土豆咖喱鸡,Coconut milk canned,200,ml
酱爆茄子,Zucchini,1,pcs
酱爆茄子,Garlic clove,2,pcs
酱爆茄子,Dark soy sauce,10,ml
酱爆茄子,Vegetable oil,15,ml
回锅肉,Pork belly,250,grams
回锅肉,Doubanjiang,15,grams
回锅肉,Light soy sauce,10,ml
回锅肉,Capsicum red,1,pcs
回锅肉,White pepper,2,grams
红烧牛腩面,Beef mince,400,grams
红烧牛腩面,Dark soy sauce,15,ml
红烧牛腩面,Long-grain rice,100,grams
红烧牛腩面,Carrot,1,pcs
红烧牛腩面,Chicken stock cube,1,pcs
Spaghetti Bolognese,Spaghetti,180,grams
Spaghetti Bolognese,Tomato,3,pcs
Spaghetti Bolognese,Beef mince,250,grams
Spaghetti Bolognese,Onion brown,1,pcs
Spaghetti Bolognese,Italian herb mix,5,grams
Creamy Mushroom Pasta,Penne pasta,160,grams
Creamy Mushroom Pasta,Mushroom button,120,grams
Creamy Mushroom Pasta,Milk,100,ml
Creamy Mushroom Pasta,Butter unsalted,20,grams
Chicken Quesadilla,Tortilla wrap,2,pcs
Chicken Quesadilla,Chicken thigh,150,grams
Chicken Quesadilla,Cheddar cheese,80,grams
Chicken Quesadilla,BBQ sauce,15,ml
Avocado Toast,Bread slice,2,pcs
Avocado Toast,Avocado,1,pcs
Avocado Toast,Egg,1,pcs
Avocado Toast,Salt,2,grams
Garlic Butter Salmon,Salmon fillet,200,grams
Garlic Butter Salmon,Butter unsalted,15,grams
Garlic Butter Salmon,Garlic clove,2,pcs
One-Pan Sausage & Veg,Sausage,200,grams
One-Pan Sausage & Veg,Potato,1,pcs
One-Pan Sausage & Veg,Broccoli floret,120,grams
One-Pan Sausage & Veg,Olive oil,20,ml
\.

-- 6. 导入食材
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  ing_record RECORD;
  ingredient_id uuid;
  category_id uuid;
  ing_count integer := 0;
BEGIN
  RAISE NOTICE '===== 导入食材 =====';
  
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

-- 7. 导入菜谱
DO $$
DECLARE
  recipe_record RECORD;
  new_recipe_id uuid;
  recipe_count integer := 0;
BEGIN
  RAISE NOTICE '===== 导入菜谱 =====';
  
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

-- 8. 导入菜谱食材关系
DO $$
DECLARE
  item_record RECORD;
  recipe_id uuid;
  ingredient_id uuid;
  recipe_title text;
  ingredient_name text;
  relation_count integer := 0;
BEGIN
  RAISE NOTICE '===== 导入菜谱食材关系 =====';
  
  -- 遍历导入的菜谱食材关系
  FOR item_record IN SELECT * FROM imported_recipe_items LOOP
    recipe_title := 'CSV_' || item_record.recipe_title;
    ingredient_name := 'CSV_' || item_record.item_name;
    
    -- 获取对应的菜谱ID（带CSV_前缀）
    SELECT id INTO recipe_id FROM recipes WHERE name = recipe_title LIMIT 1;
    
    -- 如果找到了对应菜谱
    IF recipe_id IS NOT NULL THEN
      -- 获取对应的食材ID（带CSV_前缀）
      SELECT id INTO ingredient_id FROM ingredients WHERE name = ingredient_name LIMIT 1;
      
      -- 如果找不到带前缀的食材，尝试查找不带前缀的
      IF ingredient_id IS NULL THEN
        SELECT id INTO ingredient_id FROM ingredients WHERE name = item_record.item_name LIMIT 1;
      END IF;
      
      -- 如果找到了对应食材
      IF ingredient_id IS NOT NULL THEN
        -- 检查此关系是否已存在
        IF NOT EXISTS (
          SELECT 1 FROM recipe_ingredients 
          WHERE recipe_id = recipe_id AND ingredient_id = ingredient_id
        ) THEN
          -- 插入新的菜谱-食材关系
          INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, unit)
          VALUES (recipe_id, ingredient_id, item_record.qty, item_record.unit);
          
          relation_count := relation_count + 1;
        END IF;
      END IF;
    END IF;
  END LOOP;
  
  RAISE NOTICE '成功导入 % 条菜谱-食材关系', relation_count;
END $$;

-- 9. 验证导入结果
SELECT COUNT(*) AS total_ingredients FROM ingredients WHERE name LIKE 'CSV_%';
SELECT COUNT(*) AS total_recipes FROM recipes WHERE name LIKE 'CSV_%';
SELECT COUNT(*) AS total_relations FROM recipe_ingredients;

-- 显示已导入的菜谱列表
SELECT name, difficulty, created_at 
FROM recipes 
WHERE name LIKE 'CSV_%' 
ORDER BY created_at DESC; 