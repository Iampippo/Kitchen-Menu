-- 直接导入CSV数据的简化脚本

-- 1. 创建临时表 (these will be created first)
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

-- 由convert_csv_to_sql.js生成的插入语句
-- 生成时间：2025-05-21T13:09:59.118Z

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
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Sweet potato', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Carrot', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cucumber', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Zucchini', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Broccoli', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cauliflower', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Baby spinach', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Shanghai bok choy', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Pak choy', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chinese cabbage', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Napa cabbage', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Kale', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Snow peas', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Green beans', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Eggplant', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bell pepper green', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bell pepper red', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chilli (mild)', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Onion brown', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Onion red', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Spring onion', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Garlic', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Ginger', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Shiitake mushroom', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Button mushroom', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Enoki mushroom', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Corn cob', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Pumpkin', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cherry tomato', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lettuce iceberg', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Romaine lettuce', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Avocado', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Celery', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Leek', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Asparagus', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Capsicum yellow', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bean sprout', 'ingredient', 'pcs', 'veg', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chicken breast', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chicken thigh', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chicken drumstick', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Pork belly', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Pork loin', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Pork mince', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Beef mince', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Beef rump steak', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Beef brisket', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Beef chuck', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lamb shoulder chop', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lamb leg steak', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bacon', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Ham slice', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Turkey breast', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Smoked salmon', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Salmon fillet', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Barramundi fillet', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Prawns raw', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Calamari rings', 'ingredient', 'grams', 'meat', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Long grain rice', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Jasmine rice', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Glutinous rice', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Rice vermicelli', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Fresh udon', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Dry noodles', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Spaghetti', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Penne', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Fusilli', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Tortilla wrap', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('White bread loaf', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Wholemeal bread slice', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Plain flour', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Corn starch', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Rolled oats', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Potato gnocchi', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Asian wonton wrappers', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bao bun', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Instant ramen block', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Frozen puff pastry', 'ingredient', 'grams', 'staple', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Salt', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('White pepper', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Black pepper', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Soy sauce light', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Soy sauce dark', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Oyster sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Fish sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Vinegar white', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Vinegar black', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Sesame oil', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Olive oil', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Vegetable oil', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chilli oil', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lao Gan Ma chilli crisp', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Doubanjiang', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Hoisin sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Ketchup', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Mayonnaise', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('BBQ sauce', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Honey', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Maple syrup', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Sugar caster', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Brown sugar', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Butter unsalted', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Garlic powder', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Onion powder', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Curry powder', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Five‑spice powder', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cumin ground', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Paprika', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Turmeric', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Italian herb mix', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Oregano dried', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Thyme dried', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Parsley dried', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Basil fresh', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Bay leaf', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Chicken stock cube', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Beef stock cube', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Coconut milk canned', 'seasoning', 'ml', 'seasoning', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Egg', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Milk', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cheddar cheese grated', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Mozzarella cheese block', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Parmesan cheese grated', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Greek yoghurt', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Cream thickened', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lemon', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Lime', 'ingredient', 'pcs', 'other', '');
INSERT INTO imported_ingredients (name, type, default_unit, category, note_au) VALUES ('Orange', 'ingredient', 'pcs', 'other', '');

-- 菜谱临时表插入语句
TRUNCATE TABLE IF EXISTS imported_recipes;

INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Tomato Scrambled Eggs', 'A classic Chinese home‑style dish: Tomato Scrambled Eggs.', 'Chinese', '1', '37');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Kung Pao Chicken', 'A classic Chinese home‑style dish: Kung Pao Chicken.', 'Chinese', '2', '24');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Mapo Tofu', 'A classic Chinese home‑style dish: Mapo Tofu.', 'Chinese', '3', '30');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Red‑braised Pork Belly', 'A classic Chinese home‑style dish: Red‑braised Pork Belly.', 'Chinese', '2', '23');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Yu‑Xiang Shredded Pork', 'A classic Chinese home‑style dish: Yu‑Xiang Shredded Pork.', 'Chinese', '2', '31');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Stir‑fried Shanghai Bok Choy', 'A classic Chinese home‑style dish: Stir‑fried Shanghai Bok Choy.', 'Chinese', '3', '41');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Scallion Ginger Steamed Fish', 'A classic Chinese home‑style dish: Scallion Ginger Steamed Fish.', 'Chinese', '2', '16');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Egg Fried Rice', 'A classic Chinese home‑style dish: Egg Fried Rice.', 'Chinese', '3', '34');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Wonton Soup', 'A classic Chinese home‑style dish: Wonton Soup.', 'Chinese', '4', '14');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Pan‑fried Dumplings', 'A classic Chinese home‑style dish: Pan‑fried Dumplings.', 'Chinese', '1', '26');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Green Pepper Shredded Potato', 'A classic Chinese home‑style dish: Green Pepper Shredded Potato.', 'Chinese', '2', '18');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Cold Cucumber with Garlic', 'A classic Chinese home‑style dish: Cold Cucumber with Garlic.', 'Chinese', '3', '32');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Beef and Broccoli', 'A classic Chinese home‑style dish: Beef and Broccoli.', 'Chinese', '4', '27');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Cumin Lamb', 'A classic Chinese home‑style dish: Cumin Lamb.', 'Chinese', '3', '28');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Lotus Root Stir‑fry', 'A classic Chinese home‑style dish: Lotus Root Stir‑fry.', 'Chinese', '4', '25');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Hot and Sour Soup', 'A classic Chinese home‑style dish: Hot and Sour Soup.', 'Chinese', '3', '40');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Sesame Chicken', 'A classic Chinese home‑style dish: Sesame Chicken.', 'Chinese', '3', '22');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Braised Eggplant', 'A classic Chinese home‑style dish: Braised Eggplant.', 'Chinese', '2', '29');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Teriyaki Chicken On Rice', 'A classic Chinese home‑style dish: Teriyaki Chicken On Rice.', 'Chinese', '3', '16');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Tea‑smoked Duck', 'A classic Chinese home‑style dish: Tea‑smoked Duck.', 'Chinese', '2', '39');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Salt and Pepper Squid', 'A classic Chinese home‑style dish: Salt and Pepper Squid.', 'Chinese', '4', '29');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Twice‑cooked Pork', 'A classic Chinese home‑style dish: Twice‑cooked Pork.', 'Chinese', '2', '32');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Braised Beef Noodle Soup', 'A classic Chinese home‑style dish: Braised Beef Noodle Soup.', 'Chinese', '1', '27');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Pork and Chive Dumplings', 'A classic Chinese home‑style dish: Pork and Chive Dumplings.', 'Chinese', '3', '10');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Curry Chinese Style', 'A classic Chinese home‑style dish: Chicken Curry Chinese Style.', 'Chinese', '2', '22');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Soy Braised Chicken Drumsticks', 'A classic Chinese home‑style dish: Soy Braised Chicken Drumsticks.', 'Chinese', '3', '30');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Spinach with Sesame Dressing', 'A classic Chinese home‑style dish: Spinach with Sesame Dressing.', 'Chinese', '1', '23');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Pumpkin Congee', 'A classic Chinese home‑style dish: Pumpkin Congee.', 'Chinese', '4', '25');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Sour Cabbage Stir‑fry', 'A classic Chinese home‑style dish: Sour Cabbage Stir‑fry.', 'Chinese', '4', '28');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Dry‑fried Green Beans', 'A classic Chinese home‑style dish: Dry‑fried Green Beans.', 'Chinese', '1', '30');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Char Siu Pork', 'A classic Chinese home‑style dish: Char Siu Pork.', 'Chinese', '2', '14');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Shrimp and Egg Drop Soup', 'A classic Chinese home‑style dish: Shrimp and Egg Drop Soup.', 'Chinese', '3', '31');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Beef Chow Fun', 'A classic Chinese home‑style dish: Beef Chow Fun.', 'Chinese', '4', '10');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Shanghai Braised Lion''s Head Meatballs', 'A classic Chinese home‑style dish: Shanghai Braised Lion''s Head Meatballs.', 'Chinese', '3', '24');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Sweet and Sour Pork', 'A classic Chinese home‑style dish: Sweet and Sour Pork.', 'Chinese', '4', '32');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Braised Tofu with Mushrooms', 'A classic Chinese home‑style dish: Braised Tofu with Mushrooms.', 'Chinese', '4', '35');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Cold Sesame Noodles', 'A classic Chinese home‑style dish: Cold Sesame Noodles.', 'Chinese', '4', '13');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Garlic Yu‑Choy', 'A classic Chinese home‑style dish: Garlic Yu‑Choy.', 'Chinese', '1', '45');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Steamed Egg Custard', 'A classic Chinese home‑style dish: Steamed Egg Custard.', 'Chinese', '1', '36');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Stir‑fried Tomato and Beef', 'A classic Chinese home‑style dish: Stir‑fried Tomato and Beef.', 'Chinese', '4', '18');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Lotus Leaf Chicken', 'A classic Chinese home‑style dish: Lotus Leaf Chicken.', 'Chinese', '2', '38');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Mala Hotpot Base Soup', 'A classic Chinese home‑style dish: Mala Hotpot Base Soup.', 'Chinese', '1', '21');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Braised Chicken with Potato', 'A classic Chinese home‑style dish: Braised Chicken with Potato.', 'Chinese', '4', '22');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Ginger Soy Fish Fillet', 'A classic Chinese home‑style dish: Ginger Soy Fish Fillet.', 'Chinese', '4', '26');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Dan Dan Noodles', 'A classic Chinese home‑style dish: Dan Dan Noodles.', 'Chinese', '4', '36');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Braised Pork Ribs', 'A classic Chinese home‑style dish: Braised Pork Ribs.', 'Chinese', '4', '45');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chive Scrambled Eggs', 'A classic Chinese home‑style dish: Chive Scrambled Eggs.', 'Chinese', '2', '20');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Dry Pot Cauliflower', 'A classic Chinese home‑style dish: Dry Pot Cauliflower.', 'Chinese', '2', '36');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Wings Cola', 'A classic Chinese home‑style dish: Chicken Wings Cola.', 'Chinese', '3', '42');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Eggplant with Garlic Sauce', 'A classic Chinese home‑style dish: Eggplant with Garlic Sauce.', 'Chinese', '4', '37');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Bitter Melon Stir‑fry', 'A classic Chinese home‑style dish: Bitter Melon Stir‑fry.', 'Chinese', '4', '22');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Soybean Sprout Soup', 'A classic Chinese home‑style dish: Soybean Sprout Soup.', 'Chinese', '4', '33');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Garlic Spare Ribs', 'A classic Chinese home‑style dish: Garlic Spare Ribs.', 'Chinese', '4', '25');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Braised Duck with Beer', 'A classic Chinese home‑style dish: Braised Duck with Beer.', 'Chinese', '2', '34');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Stir‑fried Cabbage', 'A classic Chinese home‑style dish: Stir‑fried Cabbage.', 'Chinese', '4', '10');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Shrimp Fried Noodles', 'A classic Chinese home‑style dish: Shrimp Fried Noodles.', 'Chinese', '2', '26');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Stir‑fried Pork with Pickled Vegetables', 'A classic Chinese home‑style dish: Stir‑fried Pork with Pickled Vegetables.', 'Chinese', '4', '32');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Steamed Minced Pork with Salted Egg', 'A classic Chinese home‑style dish: Steamed Minced Pork with Salted Egg.', 'Chinese', '4', '13');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Braised Peanuts', 'A classic Chinese home‑style dish: Braised Peanuts.', 'Chinese', '2', '44');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Pea Shoots with Garlic', 'A classic Chinese home‑style dish: Pea Shoots with Garlic.', 'Chinese', '1', '32');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Spaghetti Bolognese', 'Simple family western dinner: Spaghetti Bolognese.', 'Western', '4', '23');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Creamy Mushroom Pasta', 'Simple family western dinner: Creamy Mushroom Pasta.', 'Western', '1', '28');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Schnitzel', 'Simple family western dinner: Chicken Schnitzel.', 'Western', '2', '41');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Beef Tacos', 'Simple family western dinner: Beef Tacos.', 'Western', '2', '17');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Caesar Salad', 'Simple family western dinner: Caesar Salad.', 'Western', '2', '28');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Avocado Toast', 'Simple family western dinner: Avocado Toast.', 'Western', '1', '26');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Pan‑fried Salmon', 'Simple family western dinner: Pan‑fried Salmon.', 'Western', '4', '35');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Pumpkin Soup', 'Simple family western dinner: Pumpkin Soup.', 'Western', '4', '15');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Cottage Pie', 'Simple family western dinner: Cottage Pie.', 'Western', '3', '24');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Banana Bread', 'Simple family western dinner: Banana Bread.', 'Western', '2', '19');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Grilled Cheese Sandwich', 'Simple family western dinner: Grilled Cheese Sandwich.', 'Western', '2', '44');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Alfredo', 'Simple family western dinner: Chicken Alfredo.', 'Western', '4', '48');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Beef Burger', 'Simple family western dinner: Beef Burger.', 'Western', '3', '47');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Lamb Shepherd''s Pie', 'Simple family western dinner: Lamb Shepherd''s Pie.', 'Western', '4', '32');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Greek Salad', 'Simple family western dinner: Greek Salad.', 'Western', '3', '23');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Tomato Basil Bruschetta', 'Simple family western dinner: Tomato Basil Bruschetta.', 'Western', '4', '25');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Garlic Butter Shrimp', 'Simple family western dinner: Garlic Butter Shrimp.', 'Western', '4', '39');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Fish and Chips', 'Simple family western dinner: Fish and Chips.', 'Western', '4', '41');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Beef Steak with Pepper Sauce', 'Simple family western dinner: Beef Steak with Pepper Sauce.', 'Western', '2', '23');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Quesadilla', 'Simple family western dinner: Chicken Quesadilla.', 'Western', '1', '41');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Roast Chicken and Veg', 'Simple family western dinner: Roast Chicken and Veg.', 'Western', '3', '27');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Mac and Cheese', 'Simple family western dinner: Mac and Cheese.', 'Western', '4', '24');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Oven‑Baked Meatballs', 'Simple family western dinner: Oven‑Baked Meatballs.', 'Western', '3', '19');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Pesto Pasta', 'Simple family western dinner: Pesto Pasta.', 'Western', '3', '48');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Fajitas', 'Simple family western dinner: Chicken Fajitas.', 'Western', '3', '19');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Beef Lasagna', 'Simple family western dinner: Beef Lasagna.', 'Western', '4', '22');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Mushroom Risotto', 'Simple family western dinner: Mushroom Risotto.', 'Western', '2', '49');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Eggs Benedict', 'Simple family western dinner: Eggs Benedict.', 'Western', '1', '22');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Broccoli Cheddar Soup', 'Simple family western dinner: Broccoli Cheddar Soup.', 'Western', '2', '17');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Garlic Bread', 'Simple family western dinner: Garlic Bread.', 'Western', '1', '42');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('BBQ Pulled Pork Sliders', 'Simple family western dinner: BBQ Pulled Pork Sliders.', 'Western', '2', '45');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Honey Mustard Chicken Thighs', 'Simple family western dinner: Honey Mustard Chicken Thighs.', 'Western', '2', '18');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Tuna Mayo Pasta', 'Simple family western dinner: Tuna Mayo Pasta.', 'Western', '4', '40');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Margarita Pizza', 'Simple family western dinner: Margarita Pizza.', 'Western', '4', '39');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Pot Pie', 'Simple family western dinner: Chicken Pot Pie.', 'Western', '2', '37');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Hash Browns Breakfast', 'Simple family western dinner: Hash Browns Breakfast.', 'Western', '3', '18');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Zucchini Fritters', 'Simple family western dinner: Zucchini Fritters.', 'Western', '2', '44');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Salmon Poke Bowl', 'Simple family western dinner: Salmon Poke Bowl.', 'Western', '2', '15');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Beef Burrito', 'Simple family western dinner: Beef Burrito.', 'Western', '2', '23');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Chicken Caesar Wrap', 'Simple family western dinner: Chicken Caesar Wrap.', 'Western', '4', '33');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('5‑min Garlic Butter Noodles', 'Ultra‑lazy student meal: 5‑min Garlic Butter Noodles.', 'Lazy', '1', '9');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Microwave Cheese Mashed Potato', 'Ultra‑lazy student meal: Microwave Cheese Mashed Potato.', 'Lazy', '1', '14');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Air‑Fryer Honey Soy Wings', 'Ultra‑lazy student meal: Air‑Fryer Honey Soy Wings.', 'Lazy', '1', '11');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Instant Ramen Upgrade', 'Ultra‑lazy student meal: Instant Ramen Upgrade.', 'Lazy', '1', '11');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('One‑Pot Tomato Rice', 'Ultra‑lazy student meal: One‑Pot Tomato Rice.', 'Lazy', '1', '14');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Microwave Mug Omelette', 'Ultra‑lazy student meal: Microwave Mug Omelette.', 'Lazy', '1', '10');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Sheet Pan Sausage & Veg', 'Ultra‑lazy student meal: Sheet Pan Sausage & Veg.', 'Lazy', '1', '7');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Tuna Cheese Toast', 'Ultra‑lazy student meal: Tuna Cheese Toast.', 'Lazy', '1', '18');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Overnight Oats', 'Ultra‑lazy student meal: Overnight Oats.', 'Lazy', '1', '17');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Avocado Egg Bowl', 'Ultra‑lazy student meal: Avocado Egg Bowl.', 'Lazy', '1', '9');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Hummus Veg Wrap', 'Ultra‑lazy student meal: Hummus Veg Wrap.', 'Lazy', '1', '13');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Peanut Butter Banana Smoothie', 'Ultra‑lazy student meal: Peanut Butter Banana Smoothie.', 'Lazy', '1', '14');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Egg Fried Instant Noodles', 'Ultra‑lazy student meal: Egg Fried Instant Noodles.', 'Lazy', '1', '6');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Quick Tomato Soup', 'Ultra‑lazy student meal: Quick Tomato Soup.', 'Lazy', '1', '14');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Sriracha Mayo Tuna Rice', 'Ultra‑lazy student meal: Sriracha Mayo Tuna Rice.', 'Lazy', '1', '7');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Spam and Egg Rice Bowl', 'Ultra‑lazy student meal: Spam and Egg Rice Bowl.', 'Lazy', '1', '9');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Frozen Dumpling Hack', 'Ultra‑lazy student meal: Frozen Dumpling Hack.', 'Lazy', '1', '16');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Bagel with Cream Cheese', 'Ultra‑lazy student meal: Bagel with Cream Cheese.', 'Lazy', '1', '5');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('Microwave Brownie', 'Ultra‑lazy student meal: Microwave Brownie.', 'Lazy', '1', '10');
INSERT INTO imported_recipes (title, intro_md, cuisine, difficulty, est_minutes) VALUES ('One‑Pan Chili Con Carne', 'Ultra‑lazy student meal: One‑Pan Chili Con Carne.', 'Lazy', '1', '20');

-- 菜谱食材关系临时表插入语句
TRUNCATE TABLE IF EXISTS imported_recipe_items;

INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Scrambled Eggs', 'Shiitake mushroom', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Scrambled Eggs', 'Spaghetti', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Scrambled Eggs', 'Frozen puff pastry', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Scrambled Eggs', 'Button mushroom', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Scrambled Eggs', 'Long grain rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Kung Pao Chicken', 'Long grain rice', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Kung Pao Chicken', 'Greek yoghurt', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Kung Pao Chicken', 'Fusilli', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Kung Pao Chicken', 'Zucchini', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mapo Tofu', 'Hoisin sauce', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mapo Tofu', 'Potato gnocchi', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mapo Tofu', 'Shiitake mushroom', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mapo Tofu', 'Cauliflower', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mapo Tofu', 'Chilli oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mapo Tofu', 'Sweet potato', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Red‑braised Pork Belly', 'Pork mince', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Red‑braised Pork Belly', 'Shanghai bok choy', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Red‑braised Pork Belly', 'Ham slice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Red‑braised Pork Belly', 'Chicken stock cube', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Red‑braised Pork Belly', 'Doubanjiang', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Red‑braised Pork Belly', 'Beef chuck', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Red‑braised Pork Belly', 'Napa cabbage', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Yu‑Xiang Shredded Pork', 'Zucchini', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Yu‑Xiang Shredded Pork', 'Corn starch', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Yu‑Xiang Shredded Pork', 'Shanghai bok choy', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Yu‑Xiang Shredded Pork', 'Chilli oil', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Yu‑Xiang Shredded Pork', 'Lemon', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Shanghai Bok Choy', 'Fresh udon', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Shanghai Bok Choy', 'Ketchup', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Shanghai Bok Choy', 'Soy sauce dark', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Shanghai Bok Choy', 'Spaghetti', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Scallion Ginger Steamed Fish', 'Maple syrup', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Scallion Ginger Steamed Fish', 'Cream thickened', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Scallion Ginger Steamed Fish', 'Onion red', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Scallion Ginger Steamed Fish', 'Button mushroom', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Scallion Ginger Steamed Fish', 'Glutinous rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Rice', 'Doubanjiang', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Rice', 'Broccoli', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Rice', 'Vinegar white', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Wonton Soup', 'Chicken drumstick', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Wonton Soup', 'Beef mince', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Wonton Soup', 'Milk', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Dumplings', 'Lemon', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Dumplings', 'Black pepper', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Dumplings', 'Onion brown', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Dumplings', 'Sweet potato', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Green Pepper Shredded Potato', 'Capsicum yellow', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Green Pepper Shredded Potato', 'Pumpkin', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Green Pepper Shredded Potato', 'Lemon', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Green Pepper Shredded Potato', 'Eggplant', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Green Pepper Shredded Potato', 'Asian wonton wrappers', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Cucumber with Garlic', 'Enoki mushroom', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Cucumber with Garlic', 'Basil fresh', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Cucumber with Garlic', 'Cumin ground', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef and Broccoli', 'Cauliflower', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef and Broccoli', 'Thyme dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef and Broccoli', 'Penne', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef and Broccoli', 'Instant ramen block', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cumin Lamb', 'Zucchini', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cumin Lamb', 'Italian herb mix', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cumin Lamb', 'Bao bun', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Root Stir‑fry', 'Soy sauce light', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Root Stir‑fry', 'White pepper', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Root Stir‑fry', 'Lamb shoulder chop', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Root Stir‑fry', 'Green beans', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hot and Sour Soup', 'Black pepper', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hot and Sour Soup', 'Vegetable oil', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hot and Sour Soup', 'Fusilli', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sesame Chicken', 'Glutinous rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sesame Chicken', 'Lettuce iceberg', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sesame Chicken', 'Corn starch', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sesame Chicken', 'Wholemeal bread slice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sesame Chicken', 'Baby spinach', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Eggplant', 'Bay leaf', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Eggplant', 'Coconut milk canned', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Eggplant', 'Parmesan cheese grated', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Eggplant', 'Smoked salmon', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Eggplant', 'Fusilli', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Eggplant', 'Shanghai bok choy', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Teriyaki Chicken On Rice', 'Curry powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Teriyaki Chicken On Rice', 'Potato gnocchi', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Teriyaki Chicken On Rice', 'Prawns raw', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Teriyaki Chicken On Rice', 'Vegetable oil', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Teriyaki Chicken On Rice', 'Lettuce iceberg', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Teriyaki Chicken On Rice', 'Maple syrup', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tea‑smoked Duck', 'Fish sauce', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tea‑smoked Duck', 'Potato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tea‑smoked Duck', 'Tomato', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tea‑smoked Duck', 'Oregano dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salt and Pepper Squid', 'Parsley dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salt and Pepper Squid', 'BBQ sauce', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salt and Pepper Squid', 'Broccoli', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salt and Pepper Squid', 'Long grain rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salt and Pepper Squid', 'Five‑spice powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salt and Pepper Squid', 'Parmesan cheese grated', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Twice‑cooked Pork', 'Vegetable oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Twice‑cooked Pork', 'Onion red', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Twice‑cooked Pork', 'Potato gnocchi', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Twice‑cooked Pork', 'Pork loin', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Beef Noodle Soup', 'Corn starch', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Beef Noodle Soup', 'Doubanjiang', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Beef Noodle Soup', 'Paprika', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Beef Noodle Soup', 'Prawns raw', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pork and Chive Dumplings', 'Capsicum yellow', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pork and Chive Dumplings', 'Milk', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pork and Chive Dumplings', 'Sesame oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pork and Chive Dumplings', 'Chilli (mild)', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pork and Chive Dumplings', 'Beef brisket', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pork and Chive Dumplings', 'Ginger', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Curry Chinese Style', 'Barramundi fillet', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Curry Chinese Style', 'Chicken drumstick', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Curry Chinese Style', 'Corn starch', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Curry Chinese Style', 'Beef brisket', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Curry Chinese Style', 'Paprika', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Curry Chinese Style', 'BBQ sauce', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Curry Chinese Style', 'Maple syrup', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soy Braised Chicken Drumsticks', 'Snow peas', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soy Braised Chicken Drumsticks', 'White bread loaf', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soy Braised Chicken Drumsticks', 'Doubanjiang', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spinach with Sesame Dressing', 'Cumin ground', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spinach with Sesame Dressing', 'Cream thickened', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spinach with Sesame Dressing', 'Spring onion', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Congee', 'Black pepper', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Congee', 'Romaine lettuce', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Congee', 'Onion brown', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Congee', 'Cucumber', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Congee', 'Cherry tomato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Congee', 'Bell pepper green', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sour Cabbage Stir‑fry', 'Chinese cabbage', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sour Cabbage Stir‑fry', 'Chicken breast', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sour Cabbage Stir‑fry', 'Doubanjiang', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sour Cabbage Stir‑fry', 'Olive oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sour Cabbage Stir‑fry', 'Glutinous rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry‑fried Green Beans', 'Curry powder', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry‑fried Green Beans', 'Cucumber', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry‑fried Green Beans', 'Fusilli', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry‑fried Green Beans', 'Paprika', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Char Siu Pork', 'Bay leaf', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Char Siu Pork', 'Bao bun', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Char Siu Pork', 'Basil fresh', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Char Siu Pork', 'Asian wonton wrappers', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Char Siu Pork', 'Italian herb mix', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Char Siu Pork', 'Beef chuck', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Char Siu Pork', 'Long grain rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp and Egg Drop Soup', 'Corn starch', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp and Egg Drop Soup', 'Baby spinach', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp and Egg Drop Soup', 'Tortilla wrap', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp and Egg Drop Soup', 'Instant ramen block', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp and Egg Drop Soup', 'Chilli (mild)', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp and Egg Drop Soup', 'Celery', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp and Egg Drop Soup', 'Garlic powder', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Chow Fun', 'Carrot', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Chow Fun', 'Cherry tomato', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Chow Fun', 'Maple syrup', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Chow Fun', 'Orange', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Chow Fun', 'Chicken thigh', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shanghai Braised Lion''s Head Meatballs', 'Beef mince', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shanghai Braised Lion''s Head Meatballs', 'Honey', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shanghai Braised Lion''s Head Meatballs', 'Pak choy', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shanghai Braised Lion''s Head Meatballs', 'Chicken breast', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shanghai Braised Lion''s Head Meatballs', 'Cream thickened', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sweet and Sour Pork', 'Pork belly', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sweet and Sour Pork', 'Parmesan cheese grated', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sweet and Sour Pork', 'Lime', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sweet and Sour Pork', 'Baby spinach', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Tofu with Mushrooms', 'Chicken stock cube', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Tofu with Mushrooms', 'Lemon', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Tofu with Mushrooms', 'Shanghai bok choy', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Tofu with Mushrooms', 'Ham slice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Tofu with Mushrooms', 'Spaghetti', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Tofu with Mushrooms', 'Celery', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Tofu with Mushrooms', 'Sugar caster', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Sesame Noodles', 'Soy sauce light', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Sesame Noodles', 'Beef rump steak', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Sesame Noodles', 'Ham slice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Sesame Noodles', 'Fish sauce', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Sesame Noodles', 'Beef stock cube', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cold Sesame Noodles', 'Tortilla wrap', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Yu‑Choy', 'Egg', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Yu‑Choy', 'Basil fresh', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Yu‑Choy', 'Soy sauce light', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Egg Custard', 'Garlic powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Egg Custard', 'Corn cob', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Egg Custard', 'Honey', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Egg Custard', 'Barramundi fillet', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Egg Custard', 'Napa cabbage', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Egg Custard', 'Green beans', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Egg Custard', 'Maple syrup', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Tomato and Beef', 'Parsley dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Tomato and Beef', 'Curry powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Tomato and Beef', 'Bell pepper green', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Tomato and Beef', 'Zucchini', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Leaf Chicken', 'Barramundi fillet', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Leaf Chicken', 'Capsicum yellow', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Leaf Chicken', 'Pork mince', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lotus Leaf Chicken', 'Curry powder', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mala Hotpot Base Soup', 'Broccoli', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mala Hotpot Base Soup', 'Thyme dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mala Hotpot Base Soup', 'Cumin ground', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mala Hotpot Base Soup', 'Barramundi fillet', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Chicken with Potato', 'Jasmine rice', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Chicken with Potato', 'Beef stock cube', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Chicken with Potato', 'Ketchup', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Chicken with Potato', 'Cream thickened', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Ginger Soy Fish Fillet', 'Ham slice', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Ginger Soy Fish Fillet', 'Orange', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Ginger Soy Fish Fillet', 'Barramundi fillet', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Ginger Soy Fish Fillet', 'Chicken thigh', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Ginger Soy Fish Fillet', 'Onion powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Ginger Soy Fish Fillet', 'Napa cabbage', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Ginger Soy Fish Fillet', 'Doubanjiang', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dan Dan Noodles', 'Glutinous rice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dan Dan Noodles', 'Lemon', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dan Dan Noodles', 'Celery', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dan Dan Noodles', 'Ham slice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dan Dan Noodles', 'Pumpkin', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dan Dan Noodles', 'Five‑spice powder', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dan Dan Noodles', 'Salmon fillet', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Pork Ribs', 'Lettuce iceberg', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Pork Ribs', 'Capsicum yellow', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Pork Ribs', 'Broccoli', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Pork Ribs', 'Eggplant', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chive Scrambled Eggs', 'Maple syrup', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chive Scrambled Eggs', 'Frozen puff pastry', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chive Scrambled Eggs', 'Paprika', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry Pot Cauliflower', 'Zucchini', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry Pot Cauliflower', 'Salmon fillet', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry Pot Cauliflower', 'BBQ sauce', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Dry Pot Cauliflower', 'Fish sauce', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Wings Cola', 'Onion brown', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Wings Cola', 'Plain flour', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Wings Cola', 'Eggplant', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggplant with Garlic Sauce', 'Corn starch', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggplant with Garlic Sauce', 'Barramundi fillet', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggplant with Garlic Sauce', 'Asparagus', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggplant with Garlic Sauce', 'Fresh udon', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggplant with Garlic Sauce', 'Chicken stock cube', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggplant with Garlic Sauce', 'Ginger', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Bitter Melon Stir‑fry', 'Cumin ground', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Bitter Melon Stir‑fry', 'Green beans', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Bitter Melon Stir‑fry', 'Plain flour', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soybean Sprout Soup', 'Cream thickened', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soybean Sprout Soup', 'Greek yoghurt', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soybean Sprout Soup', 'Orange', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soybean Sprout Soup', 'Salt', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soybean Sprout Soup', 'White pepper', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Soybean Sprout Soup', 'Beef mince', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Spare Ribs', 'Chicken thigh', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Spare Ribs', 'Pork mince', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Spare Ribs', 'Doubanjiang', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Spare Ribs', 'Hoisin sauce', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Spare Ribs', 'Soy sauce dark', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Duck with Beer', 'Black pepper', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Duck with Beer', 'Bell pepper green', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Duck with Beer', 'Zucchini', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Duck with Beer', 'Celery', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Duck with Beer', 'BBQ sauce', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Cabbage', 'Bacon', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Cabbage', 'Spaghetti', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Cabbage', 'Honey', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Cabbage', 'Fusilli', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp Fried Noodles', 'Vegetable oil', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp Fried Noodles', 'Thyme dried', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp Fried Noodles', 'Paprika', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Shrimp Fried Noodles', 'Fresh udon', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Pork with Pickled Vegetables', 'Oregano dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Pork with Pickled Vegetables', 'Frozen puff pastry', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Stir‑fried Pork with Pickled Vegetables', 'Cream thickened', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Minced Pork with Salted Egg', 'Asian wonton wrappers', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Minced Pork with Salted Egg', 'Fish sauce', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Minced Pork with Salted Egg', 'Mozzarella cheese block', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Minced Pork with Salted Egg', 'Onion brown', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Steamed Minced Pork with Salted Egg', 'Pak choy', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Peanuts', 'Cream thickened', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Peanuts', 'Parsley dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Peanuts', 'Oregano dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Braised Peanuts', 'Bacon', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pea Shoots with Garlic', 'Ketchup', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pea Shoots with Garlic', 'Pumpkin', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pea Shoots with Garlic', 'Bacon', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pea Shoots with Garlic', 'Chicken stock cube', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pea Shoots with Garlic', 'Honey', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pea Shoots with Garlic', 'Penne', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pea Shoots with Garlic', 'Rice vermicelli', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Thyme dried', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Cheddar cheese grated', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Asian wonton wrappers', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Lao Gan Ma chilli crisp', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Pak choy', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spaghetti Bolognese', 'Glutinous rice', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Spring onion', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Onion red', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Vegetable oil', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Creamy Mushroom Pasta', 'Cucumber', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Schnitzel', 'Prawns raw', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Schnitzel', 'Beef rump steak', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Schnitzel', 'Soy sauce light', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Schnitzel', 'Lettuce iceberg', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Schnitzel', 'Vinegar black', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Schnitzel', 'Capsicum yellow', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Tacos', 'Chicken breast', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Tacos', 'Instant ramen block', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Tacos', 'Thyme dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Tacos', 'Olive oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Caesar Salad', 'Prawns raw', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Caesar Salad', 'Lao Gan Ma chilli crisp', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Caesar Salad', 'Zucchini', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Caesar Salad', 'Long grain rice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Caesar Salad', 'Potato gnocchi', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Coconut milk canned', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Chicken breast', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Greek yoghurt', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Toast', 'Egg', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Salmon', 'Onion red', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Salmon', 'Pak choy', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Salmon', 'Olive oil', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pan‑fried Salmon', 'Orange', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Soup', 'Soy sauce light', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Soup', 'Lamb shoulder chop', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pumpkin Soup', 'Olive oil', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cottage Pie', 'Greek yoghurt', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cottage Pie', 'Bao bun', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cottage Pie', 'Cream thickened', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cottage Pie', 'Pork belly', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Cottage Pie', 'Beef chuck', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Banana Bread', 'Oregano dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Banana Bread', 'Sweet potato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Banana Bread', 'Vegetable oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Banana Bread', 'Garlic powder', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Banana Bread', 'Spaghetti', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Grilled Cheese Sandwich', 'Oregano dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Grilled Cheese Sandwich', 'Cumin ground', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Grilled Cheese Sandwich', 'Oyster sauce', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Alfredo', 'Long grain rice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Alfredo', 'Wholemeal bread slice', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Alfredo', 'Fresh udon', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Alfredo', 'Calamari rings', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Burger', 'Asian wonton wrappers', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Burger', 'Onion red', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Burger', 'Turkey breast', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lamb Shepherd''s Pie', 'Glutinous rice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lamb Shepherd''s Pie', 'Sugar caster', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lamb Shepherd''s Pie', 'Thyme dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lamb Shepherd''s Pie', 'Asparagus', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lamb Shepherd''s Pie', 'Dry noodles', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Lamb Shepherd''s Pie', 'Calamari rings', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Greek Salad', 'Zucchini', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Greek Salad', 'Pumpkin', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Greek Salad', 'Mozzarella cheese block', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Basil Bruschetta', 'Olive oil', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Basil Bruschetta', 'Ginger', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Basil Bruschetta', 'Lao Gan Ma chilli crisp', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Basil Bruschetta', 'Button mushroom', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Basil Bruschetta', 'Napa cabbage', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tomato Basil Bruschetta', 'Curry powder', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Shrimp', 'Mozzarella cheese block', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Shrimp', 'Garlic powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Shrimp', 'Orange', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Shrimp', 'Button mushroom', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Shrimp', 'Black pepper', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Butter Shrimp', 'Chilli oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Fish and Chips', 'Thyme dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Fish and Chips', 'Greek yoghurt', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Fish and Chips', 'Avocado', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Fish and Chips', 'Penne', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Fish and Chips', 'White pepper', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Fish and Chips', 'Maple syrup', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Fish and Chips', 'Rice vermicelli', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Steak with Pepper Sauce', 'BBQ sauce', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Steak with Pepper Sauce', 'Dry noodles', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Steak with Pepper Sauce', 'Basil fresh', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Steak with Pepper Sauce', 'Penne', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Steak with Pepper Sauce', 'Vinegar white', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Steak with Pepper Sauce', 'Avocado', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Beef mince', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Egg', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Cheddar cheese grated', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Celery', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Orange', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Quesadilla', 'Vegetable oil', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Roast Chicken and Veg', 'Tomato', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Roast Chicken and Veg', 'Salmon fillet', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Roast Chicken and Veg', 'Fusilli', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Roast Chicken and Veg', 'Baby spinach', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Roast Chicken and Veg', 'Green beans', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mac and Cheese', 'Pork loin', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mac and Cheese', 'Vegetable oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mac and Cheese', 'Onion powder', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mac and Cheese', 'Bean sprout', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mac and Cheese', 'Garlic', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mac and Cheese', 'Maple syrup', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mac and Cheese', 'Hoisin sauce', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Oven‑Baked Meatballs', 'Sweet potato', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Oven‑Baked Meatballs', 'Ham slice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Oven‑Baked Meatballs', 'Smoked salmon', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Oven‑Baked Meatballs', 'Sugar caster', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Oven‑Baked Meatballs', 'Lamb leg steak', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Oven‑Baked Meatballs', 'Pak choy', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pesto Pasta', 'Leek', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pesto Pasta', 'Dry noodles', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Pesto Pasta', 'Napa cabbage', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Fajitas', 'Tomato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Fajitas', 'White bread loaf', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Fajitas', 'Romaine lettuce', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Fajitas', 'Brown sugar', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Fajitas', 'Vinegar black', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Fajitas', 'Soy sauce dark', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Fajitas', 'Zucchini', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Lasagna', 'Fish sauce', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Lasagna', 'White pepper', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Lasagna', 'Lettuce iceberg', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Lasagna', 'Avocado', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Lasagna', 'Napa cabbage', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Lasagna', 'Romaine lettuce', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mushroom Risotto', 'Eggplant', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mushroom Risotto', 'Curry powder', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Mushroom Risotto', 'Chinese cabbage', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggs Benedict', 'Vinegar white', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggs Benedict', 'Fresh udon', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggs Benedict', 'Onion brown', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggs Benedict', 'Baby spinach', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggs Benedict', 'Salt', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Eggs Benedict', 'Parmesan cheese grated', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Broccoli Cheddar Soup', 'Spring onion', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Broccoli Cheddar Soup', 'Barramundi fillet', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Broccoli Cheddar Soup', 'Olive oil', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Broccoli Cheddar Soup', 'Button mushroom', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Broccoli Cheddar Soup', 'Chilli (mild)', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Broccoli Cheddar Soup', 'Black pepper', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Bread', 'Bean sprout', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Bread', 'Tortilla wrap', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Bread', 'Frozen puff pastry', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Bread', 'Capsicum yellow', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Bread', 'Fusilli', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Bread', 'Beef mince', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Garlic Bread', 'Cream thickened', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('BBQ Pulled Pork Sliders', 'Honey', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('BBQ Pulled Pork Sliders', 'Cherry tomato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('BBQ Pulled Pork Sliders', 'Potato gnocchi', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('BBQ Pulled Pork Sliders', 'Tortilla wrap', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('BBQ Pulled Pork Sliders', 'Greek yoghurt', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Honey Mustard Chicken Thighs', 'Beef stock cube', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Honey Mustard Chicken Thighs', 'Leek', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Honey Mustard Chicken Thighs', 'Egg', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Honey Mustard Chicken Thighs', 'Thyme dried', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Honey Mustard Chicken Thighs', 'Potato gnocchi', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Honey Mustard Chicken Thighs', 'Bao bun', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Honey Mustard Chicken Thighs', 'White pepper', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Mayo Pasta', 'Spring onion', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Mayo Pasta', 'Sesame oil', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Mayo Pasta', 'Fish sauce', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Margarita Pizza', 'Vinegar black', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Margarita Pizza', 'Vegetable oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Margarita Pizza', 'Chilli (mild)', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Pot Pie', 'Pumpkin', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Pot Pie', 'Black pepper', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Pot Pie', 'Salt', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Pot Pie', 'Potato', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Pot Pie', 'Cumin ground', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Pot Pie', 'Fusilli', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hash Browns Breakfast', 'Rice vermicelli', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hash Browns Breakfast', 'Spaghetti', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hash Browns Breakfast', 'Chicken stock cube', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hash Browns Breakfast', 'Salmon fillet', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hash Browns Breakfast', 'Pork loin', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hash Browns Breakfast', 'Potato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Zucchini Fritters', 'Plain flour', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Zucchini Fritters', 'Turmeric', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Zucchini Fritters', 'Celery', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Zucchini Fritters', 'Milk', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Zucchini Fritters', 'Broccoli', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Zucchini Fritters', 'Potato gnocchi', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salmon Poke Bowl', 'Paprika', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salmon Poke Bowl', 'Curry powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Salmon Poke Bowl', 'Coconut milk canned', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Burrito', 'Asian wonton wrappers', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Burrito', 'Carrot', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Beef Burrito', 'Pork mince', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Caesar Wrap', 'Basil fresh', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Caesar Wrap', 'Soy sauce dark', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Caesar Wrap', 'Tomato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Caesar Wrap', 'Instant ramen block', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Caesar Wrap', 'Lao Gan Ma chilli crisp', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Caesar Wrap', 'Five‑spice powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Chicken Caesar Wrap', 'Bay leaf', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('5‑min Garlic Butter Noodles', 'Vinegar white', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('5‑min Garlic Butter Noodles', 'Bell pepper red', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('5‑min Garlic Butter Noodles', 'Chilli oil', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Cheese Mashed Potato', 'Pork mince', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Cheese Mashed Potato', 'Bacon', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Cheese Mashed Potato', 'Spaghetti', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Cheese Mashed Potato', 'Chilli (mild)', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Cheese Mashed Potato', 'Asian wonton wrappers', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Air‑Fryer Honey Soy Wings', 'Italian herb mix', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Air‑Fryer Honey Soy Wings', 'Kale', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Air‑Fryer Honey Soy Wings', 'Egg', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Air‑Fryer Honey Soy Wings', 'Beef brisket', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Instant Ramen Upgrade', 'Snow peas', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Instant Ramen Upgrade', 'Green beans', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Instant Ramen Upgrade', 'Capsicum yellow', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Instant Ramen Upgrade', 'Onion powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Instant Ramen Upgrade', 'Curry powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Instant Ramen Upgrade', 'Corn starch', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Instant Ramen Upgrade', 'Parmesan cheese grated', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pot Tomato Rice', 'Thyme dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pot Tomato Rice', 'Shiitake mushroom', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pot Tomato Rice', 'Romaine lettuce', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pot Tomato Rice', 'Cheddar cheese grated', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Mug Omelette', 'Beef mince', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Mug Omelette', 'Celery', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Mug Omelette', 'Barramundi fillet', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Mug Omelette', 'Button mushroom', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sheet Pan Sausage & Veg', 'Ketchup', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sheet Pan Sausage & Veg', 'Rolled oats', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sheet Pan Sausage & Veg', 'Potato gnocchi', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Cheese Toast', 'Jasmine rice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Cheese Toast', 'Glutinous rice', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Cheese Toast', 'Barramundi fillet', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Cheese Toast', 'Garlic powder', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Cheese Toast', 'White pepper', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Tuna Cheese Toast', 'Shanghai bok choy', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Overnight Oats', 'Dry noodles', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Overnight Oats', 'Orange', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Overnight Oats', 'Vegetable oil', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Egg Bowl', 'Zucchini', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Egg Bowl', 'Lamb shoulder chop', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Egg Bowl', 'Fresh udon', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Avocado Egg Bowl', 'Instant ramen block', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hummus Veg Wrap', 'Button mushroom', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hummus Veg Wrap', 'Tomato', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Hummus Veg Wrap', 'Thyme dried', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Peanut Butter Banana Smoothie', 'Bell pepper red', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Peanut Butter Banana Smoothie', 'Celery', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Peanut Butter Banana Smoothie', 'Beef mince', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Peanut Butter Banana Smoothie', 'Cumin ground', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Peanut Butter Banana Smoothie', 'Bacon', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Peanut Butter Banana Smoothie', 'Parmesan cheese grated', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Instant Noodles', 'Coconut milk canned', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Instant Noodles', 'Pork mince', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Instant Noodles', 'Sugar caster', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Instant Noodles', 'Lamb leg steak', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Egg Fried Instant Noodles', 'Paprika', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Quick Tomato Soup', 'Prawns raw', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Quick Tomato Soup', 'Greek yoghurt', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Quick Tomato Soup', 'Chicken thigh', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Quick Tomato Soup', 'Asian wonton wrappers', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Quick Tomato Soup', 'Vinegar white', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Quick Tomato Soup', 'Hoisin sauce', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sriracha Mayo Tuna Rice', 'Plain flour', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sriracha Mayo Tuna Rice', 'Ketchup', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sriracha Mayo Tuna Rice', 'Cucumber', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Sriracha Mayo Tuna Rice', 'Turmeric', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spam and Egg Rice Bowl', 'Beef brisket', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spam and Egg Rice Bowl', 'Chicken drumstick', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spam and Egg Rice Bowl', 'Lamb leg steak', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spam and Egg Rice Bowl', 'Greek yoghurt', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spam and Egg Rice Bowl', 'Frozen puff pastry', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Spam and Egg Rice Bowl', 'Ketchup', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Frozen Dumpling Hack', 'Beef stock cube', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Frozen Dumpling Hack', 'Vinegar white', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Frozen Dumpling Hack', 'Long grain rice', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Frozen Dumpling Hack', 'Prawns raw', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Frozen Dumpling Hack', 'Chinese cabbage', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Frozen Dumpling Hack', 'Greek yoghurt', '3', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Frozen Dumpling Hack', 'Chicken drumstick', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Bagel with Cream Cheese', 'Shanghai bok choy', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Bagel with Cream Cheese', 'Thyme dried', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Bagel with Cream Cheese', 'Prawns raw', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Bagel with Cream Cheese', 'Lettuce iceberg', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Brownie', 'Pork mince', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Brownie', 'Instant ramen block', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Brownie', 'Lao Gan Ma chilli crisp', '100', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Brownie', 'Potato gnocchi', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Brownie', 'Vinegar black', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Brownie', 'Basil fresh', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('Microwave Brownie', 'Eggplant', '2', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pan Chili Con Carne', 'Oregano dried', '50', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pan Chili Con Carne', 'Shanghai bok choy', '1', 'pcs');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pan Chili Con Carne', 'Mayonnaise', '150', 'grams');
INSERT INTO imported_recipe_items (recipe_title, item_name, qty, unit) VALUES ('One‑Pan Chili Con Carne', 'Hoisin sauce', '100', 'grams');

-- 执行导入脚本
\i ./import_recipes.sql


-- 2. 直接导入食材 - 使用前缀避免与现有数据冲突
DO $$
DECLARE
  system_user_id uuid := '00000000-0000-0000-0000-000000000000';
  ing_record RECORD;
  category_id uuid;
BEGIN
  -- 如果系统用户不存在，创建一个
  IF NOT EXISTS (SELECT 1 FROM ingredients WHERE user_id = system_user_id LIMIT 1) THEN
    -- 确保ingredient_categories表中有基础分类
    IF NOT EXISTS (SELECT 1 FROM ingredient_categories WHERE name = '蔬菜') THEN
      INSERT INTO ingredient_categories (id, name, color) VALUES 
      (gen_random_uuid(), '蔬菜', 'bg-green-400');
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM ingredient_categories WHERE name = '肉类') THEN
      INSERT INTO ingredient_categories (id, name, color) VALUES 
      (gen_random_uuid(), '肉类', 'bg-red-400');
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM ingredient_categories WHERE name = '调味料') THEN
      INSERT INTO ingredient_categories (id, name, color) VALUES 
      (gen_random_uuid(), '调味料', 'bg-amber-400');
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM ingredient_categories WHERE name = '粮食') THEN
      INSERT INTO ingredient_categories (id, name, color) VALUES 
      (gen_random_uuid(), '粮食', 'bg-yellow-400');
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM ingredient_categories WHERE name = '其他') THEN
      INSERT INTO ingredient_categories (id, name, color) VALUES 
      (gen_random_uuid(), '其他', 'bg-gray-400');
    END IF;
    
    -- 创建一个基础食材作为示例
    INSERT INTO ingredients (id, name, color, amount, unit, category_id, user_id)
    VALUES (
      gen_random_uuid(),
      '测试食材',
      'bg-gray-400',
      500,
      'g',
      (SELECT id FROM ingredient_categories WHERE name = '其他' LIMIT 1),
      system_user_id
    );
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
      ELSE '其他'
    END;
    
    -- 如果找不到分类，使用默认分类
    IF category_id IS NULL THEN
      SELECT id INTO category_id FROM ingredient_categories LIMIT 1;
    END IF;
    
    -- 插入新食材，名称前加CSV_前缀避免冲突
    INSERT INTO ingredients (
      id, name, color, amount, unit, category_id, user_id
    ) VALUES (
      gen_random_uuid(),
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
  END LOOP;
END $$;

-- 3. 直接导入菜谱
DO $$
DECLARE
  recipe_record RECORD;
  new_recipe_id uuid;
BEGIN
  -- 遍历导入的菜谱
  FOR recipe_record IN SELECT * FROM imported_recipes LOOP
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
  END LOOP;
END $$;

-- 4. 导入菜谱与食材的关系
DO $$
DECLARE
  item_record RECORD;
  recipe_id uuid;
BEGIN
  -- 遍历导入的菜谱食材关系
  FOR item_record IN SELECT * FROM imported_recipe_items LOOP
    -- 获取对应的菜谱ID（带CSV_前缀）
    SELECT id INTO recipe_id FROM recipes WHERE name = 'CSV_' || item_record.recipe_title LIMIT 1;
    
    -- 如果找到了对应菜谱
    IF recipe_id IS NOT NULL THEN
      -- 插入菜谱食材关系
      INSERT INTO recipe_ingredients (recipe_id, ingredient_name)
      VALUES (recipe_id, item_record.item_name);
    END IF;
  END LOOP;
END $$;

-- 5. 查看导入结果
SELECT COUNT(*) AS imported_ingredients FROM ingredients WHERE name LIKE 'CSV_%';
SELECT COUNT(*) AS imported_recipes FROM recipes WHERE name LIKE 'CSV_%';
SELECT COUNT(*) AS imported_recipe_items FROM recipe_ingredients 
WHERE recipe_id IN (SELECT id FROM recipes WHERE name LIKE 'CSV_%');

-- 6. 清理临时表
DROP TABLE IF EXISTS imported_ingredients;
DROP TABLE IF EXISTS imported_recipes;
DROP TABLE IF EXISTS imported_recipe_items; 