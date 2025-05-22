-- 简化版菜谱导入脚本
-- 此脚本只导入基本的菜谱数据，适合在Supabase控制台中直接执行

-- 1. 创建临时表
CREATE TEMP TABLE IF NOT EXISTS temp_recipes (
  title text,
  description text,
  cuisine text,
  difficulty integer,
  est_minutes integer
);

-- 2. 插入菜谱数据到临时表
COPY temp_recipes (title, description, cuisine, difficulty, est_minutes) FROM stdin WITH (FORMAT csv, HEADER false);
番茄炒鸡蛋,经典留学生快手菜，10分钟搞定，营养又下饭。,Chinese,1,15
蚝油生菜,只需一口热锅和蚝油，就能做出脆嫩爽口的生菜。,Chinese,1,12
土豆咖喱鸡,咖喱粉搭配椰奶，浓郁下饭的家常版咖喱鸡。,Chinese,2,35
酱爆茄子,茄子吸足酱香，配米饭绝配。,Chinese,2,25
回锅肉,澳洲超市五花肉也能炒出地道川味回锅肉。,Chinese,3,40
红烧牛腩面,用高压锅炖牛腩，香浓汤底配拉面。,Chinese,3,60
Spaghetti Bolognese,经典意式肉酱面，番茄与牛肉的完美结合。,Western,1,25
Creamy Mushroom Pasta,奶油蘑菇酱浓郁顺滑，20分钟即可上桌。,Western,1,20
Chicken Quesadilla,墨西哥风味鸡肉芝士夹饼，平底锅快速完成。,Western,2,18
Avocado Toast,牛油果吐司配上溏心蛋，营养早餐首选。,Western,1,10
Garlic Butter Salmon,黄油蒜香三文鱼，烤箱 15 分钟完成。,Western,2,25
One-Pan Sausage & Veg,香肠蔬菜一盘烤，懒人晚餐不洗锅。,Western,2,30
\.

-- 3. 将菜谱数据导入到实际表
DO $$
DECLARE
  temp_record RECORD;
  new_recipe_id uuid;
  recipe_count integer := 0;
BEGIN
  -- 遍历临时表中的菜谱数据
  FOR temp_record IN SELECT * FROM temp_recipes LOOP
    -- 检查菜谱是否已存在
    IF NOT EXISTS (
      SELECT 1 FROM recipes 
      WHERE name = temp_record.title OR name = 'CSV_' || temp_record.title
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

-- 4. 检查导入结果
SELECT name, difficulty, created_at 
FROM recipes 
ORDER BY created_at DESC 
LIMIT 15; 