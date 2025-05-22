-- 由convert_csv_to_sql.js生成的插入语句
-- 生成时间：2025-05-21T13:26:01.555Z

-- 创建临时表

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

-- 食材临时表插入语句
TRUNCATE TABLE IF EXISTS imported_ingredients;

INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Tomato', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Potato', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Carrot', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Brown onion', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Garlic clove', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Ginger', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Baby spinach', 'ingredient', 'grams', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Broccoli floret', 'ingredient', 'grams', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chicken thigh', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Pork belly', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Beef mince', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bacon rasher', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Egg', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Milk', 'ingredient', 'ml', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cheddar cheese', 'ingredient', 'grams', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Butter unsalted', 'ingredient', 'grams', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Olive oil', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Vegetable oil', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Light soy sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Dark soy sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Oyster sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Doubanjiang', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Ketchup', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('BBQ sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Salt', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('White pepper', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Sugar', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Corn starch', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Long-grain rice', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Jasmine rice', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Spaghetti', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Penne pasta', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Tortilla wrap', 'ingredient', 'pcs', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Flour plain', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Rolled oats', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bao bun', 'ingredient', 'pcs', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Instant ramen block', 'ingredient', 'pcs', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Fresh udon', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Frozen puff pastry', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Sesame oil', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Vinegar white', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Vinegar black', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chilli flakes', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Curry powder', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Five-spice powder', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Italian herb mix', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Honey', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Maple syrup', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chicken stock cube', 'seasoning', 'pcs', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Parsley dried', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Basil fresh', 'seasoning', 'grams', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lemon', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lime', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Orange', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Avocado', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Mushroom button', 'ingredient', 'grams', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Zucchini', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Capsicum red', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Snow peas', 'ingredient', 'grams', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Calamari rings', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Salmon fillet', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Prawn raw', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bread slice', 'ingredient', 'pcs', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Hash brown', 'ingredient', 'pcs', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Wok', 'tool', 'pcs', 'tool', 'Kitchen utensil');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Saucepan', 'tool', 'pcs', 'tool', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Frying pan', 'tool', 'pcs', 'tool', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Baking tray', 'tool', 'pcs', 'tool', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Rice cooker', 'tool', 'pcs', 'tool', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Air-fryer', 'tool', 'pcs', 'tool', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chef knife', 'tool', 'pcs', 'tool', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cutting board', 'tool', 'pcs', 'tool', 'Kitchen utensil');

-- 菜谱临时表插入语句
TRUNCATE TABLE IF EXISTS imported_recipes;

INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('番茄炒鸡蛋', '经典留学生快手菜，10分钟搞定，营养又下饭。', 'Chinese', '1', '15');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('蚝油生菜', '只需一口热锅和蚝油，就能做出脆嫩爽口的生菜。', 'Chinese', '1', '12');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('土豆咖喱鸡', '咖喱粉搭配椰奶，浓郁下饭的家常版咖喱鸡。', 'Chinese', '2', '35');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('酱爆茄子', '茄子吸足酱香，配米饭绝配。', 'Chinese', '2', '25');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('回锅肉', '澳洲超市五花肉也能炒出地道川味回锅肉。', 'Chinese', '3', '40');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('红烧牛腩面', '用高压锅炖牛腩，香浓汤底配拉面。', 'Chinese', '3', '60');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Spaghetti Bolognese', '经典意式肉酱面，番茄与牛肉的完美结合。', 'Western', '1', '25');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Creamy Mushroom Pasta', '奶油蘑菇酱浓郁顺滑，20分钟即可上桌。', 'Western', '1', '20');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Quesadilla', '墨西哥风味鸡肉芝士夹饼，平底锅快速完成。', 'Western', '2', '18');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Avocado Toast', '牛油果吐司配上溏心蛋，营养早餐首选。', 'Western', '1', '10');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Garlic Butter Salmon', '黄油蒜香三文鱼，烤箱 15 分钟完成。', 'Western', '2', '25');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('One-Pan Sausage & Veg', '香肠蔬菜一盘烤，懒人晚餐不洗锅。', 'Western', '2', '30');

-- 菜谱食材关系临时表插入语句
TRUNCATE TABLE IF EXISTS imported_recipe_items;

INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('番茄炒鸡蛋', 'Tomato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('番茄炒鸡蛋', 'Egg', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('番茄炒鸡蛋', 'Salt', '2', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('番茄炒鸡蛋', 'White pepper', '1', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('番茄炒鸡蛋', 'Vegetable oil', '10', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('蚝油生菜', 'Baby spinach', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('蚝油生菜', 'Oyster sauce', '15', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('蚝油生菜', 'Garlic clove', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('蚝油生菜', 'Olive oil', '10', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('土豆咖喱鸡', 'Potato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('土豆咖喱鸡', 'Chicken thigh', '300', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('土豆咖喱鸡', 'Curry powder', '8', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('土豆咖喱鸡', 'Light soy sauce', '10', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('土豆咖喱鸡', 'Coconut milk canned', '200', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('酱爆茄子', 'Zucchini', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('酱爆茄子', 'Garlic clove', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('酱爆茄子', 'Dark soy sauce', '10', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('酱爆茄子', 'Vegetable oil', '15', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('回锅肉', 'Pork belly', '250', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('回锅肉', 'Doubanjiang', '15', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('回锅肉', 'Light soy sauce', '10', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('回锅肉', 'Capsicum red', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('回锅肉', 'White pepper', '2', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('红烧牛腩面', 'Beef mince', '400', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('红烧牛腩面', 'Dark soy sauce', '15', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('红烧牛腩面', 'Long-grain rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('红烧牛腩面', 'Carrot', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('红烧牛腩面', 'Chicken stock cube', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Spaghetti', '180', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Tomato', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Beef mince', '250', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Onion brown', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Italian herb mix', '5', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Penne pasta', '160', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Mushroom button', '120', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Milk', '100', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Butter unsalted', '20', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Tortilla wrap', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Chicken thigh', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Cheddar cheese', '80', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'BBQ sauce', '15', 'ml');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Bread slice', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Avocado', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Egg', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Salt', '2', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Salmon', 'Salmon fillet', '200', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Salmon', 'Butter unsalted', '15', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Salmon', 'Garlic clove', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One-Pan Sausage & Veg', 'Sausage', '200', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One-Pan Sausage & Veg', 'Potato', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One-Pan Sausage & Veg', 'Broccoli floret', '120', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One-Pan Sausage & Veg', 'Olive oil', '20', 'ml');

-- 执行导入脚本
\i ./import_full_process.sql
