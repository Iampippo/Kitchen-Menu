-- 库存材料导入脚本
-- 此脚本导入食材、调料和厨具到系统库存

-- 1. 确保系统用户和基础分类存在
INSERT INTO profiles (id, username, full_name)
VALUES 
('00000000-0000-0000-0000-000000000000', 'system', 'System User') 
ON CONFLICT (id) DO NOTHING;

-- 创建食材分类（如果不存在）
INSERT INTO ingredient_categories (id, name, color)
VALUES 
(gen_random_uuid(), '蔬菜', 'bg-green-400'),
(gen_random_uuid(), '肉类', 'bg-red-400'),
(gen_random_uuid(), '调味料', 'bg-amber-400'),
(gen_random_uuid(), '粮食', 'bg-yellow-400'),
(gen_random_uuid(), '其他', 'bg-gray-400'),
(gen_random_uuid(), '工具', 'bg-gray-400')
ON CONFLICT (name) DO UPDATE SET color = EXCLUDED.color;

-- 2. 创建临时表
CREATE TEMP TABLE IF NOT EXISTS temp_ingredients (
  name text,
  type text,
  default_unit text,
  category text,
  note text
);

-- 3. 插入库存材料数据
COPY temp_ingredients (name, type, default_unit, category, note) FROM stdin WITH (FORMAT csv, HEADER false);
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
Wok,tool,pcs,tool,
Saucepan,tool,pcs,tool,
Frying pan,tool,pcs,tool,
Baking tray,tool,pcs,tool,
Rice cooker,tool,pcs,tool,
Air-fryer,tool,pcs,tool,
Chef knife,tool,pcs,tool,
Cutting board,tool,pcs,tool,
\.

-- 4. 导入库存材料
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  temp_record RECORD;
  ingredient_id uuid;
  category_id uuid;
  ing_count integer := 0;
BEGIN
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

-- 5. 检查导入结果
SELECT ic.name AS category, COUNT(i.*) AS count
FROM ingredients i
JOIN ingredient_categories ic ON i.category_id = ic.id
WHERE i.user_id = '00000000-0000-0000-0000-000000000000'
GROUP BY ic.name
ORDER BY ic.name;

-- 显示所有导入的材料
SELECT i.name, i.color, i.unit, ic.name AS category
FROM ingredients i
JOIN ingredient_categories ic ON i.category_id = ic.id
WHERE i.user_id = '00000000-0000-0000-0000-000000000000'
ORDER BY ic.name, i.name; 