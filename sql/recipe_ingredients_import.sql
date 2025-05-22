-- 菜谱和食材关联关系导入脚本
-- 此脚本建立菜谱与食材的关联关系

-- 1. 创建临时表
CREATE TEMP TABLE IF NOT EXISTS temp_recipe_items (
  recipe_title text,
  item_name text,
  qty text,
  unit text
);

-- 2. 插入菜谱食材关系数据
COPY temp_recipe_items (recipe_title, item_name, qty, unit) FROM stdin WITH (FORMAT csv, HEADER false);
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
Spaghetti Bolognese,Brown onion,1,pcs
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

-- 3. 导入菜谱与食材的关系
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  item_record RECORD;
  recipe_id uuid;
  ingredient_id uuid;
  relation_count integer := 0;
  missing_ingredients text := '';
  missing_recipes text := '';
BEGIN
  -- 遍历临时表中的菜谱食材关系
  FOR item_record IN SELECT * FROM temp_recipe_items LOOP
    -- 获取对应的菜谱ID
    SELECT id INTO recipe_id FROM recipes WHERE name = item_record.recipe_title LIMIT 1;
    
    -- 获取对应的食材ID
    SELECT id INTO ingredient_id FROM ingredients 
    WHERE name = item_record.item_name 
    AND user_id = system_user_id
    LIMIT 1;
    
    -- 如果找不到对应食材，记录下来
    IF ingredient_id IS NULL THEN
      missing_ingredients := missing_ingredients || item_record.item_name || ', ';
      CONTINUE;
    END IF;
    
    -- 如果找不到对应菜谱，记录下来
    IF recipe_id IS NULL THEN
      missing_recipes := missing_recipes || item_record.recipe_title || ', ';
      CONTINUE;
    END IF;
    
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

-- 4. 检查导入结果 - 显示每个菜谱包含的食材数量
SELECT r.name AS recipe_name, COUNT(ri.*) AS ingredient_count
FROM recipes r
LEFT JOIN recipe_ingredients ri ON r.id = ri.recipe_id
GROUP BY r.name
ORDER BY ingredient_count DESC;

-- 5. 显示菜谱及其食材明细
SELECT 
  r.name AS recipe_name, 
  i.name AS ingredient_name,
  ri.quantity,
  ri.unit,
  ic.name AS ingredient_category
FROM recipes r
JOIN recipe_ingredients ri ON r.id = ri.recipe_id
JOIN ingredients i ON ri.ingredient_id = i.id
JOIN ingredient_categories ic ON i.category_id = ic.id
ORDER BY r.name, ic.name, i.name
LIMIT 50; 