-- 创建食材分类和系统用户的SQL脚本

-- 1. 添加系统用户（如果不存在）
INSERT INTO profiles (id, username, full_name)
VALUES 
('00000000-0000-0000-0000-000000000000', 'system', 'System User') 
ON CONFLICT (id) DO NOTHING;

-- 2. 创建或更新食材分类 
INSERT INTO ingredient_categories (id, name, color)
VALUES 
(gen_random_uuid(), '蔬菜', 'bg-green-400'),
(gen_random_uuid(), '肉类', 'bg-red-400'),
(gen_random_uuid(), '调味料', 'bg-amber-400'),
(gen_random_uuid(), '粮食', 'bg-yellow-400'),
(gen_random_uuid(), '其他', 'bg-gray-400'),
(gen_random_uuid(), '工具', 'bg-gray-400')
ON CONFLICT (name) DO UPDATE SET color = EXCLUDED.color;

-- 3. 确认创建成功
SELECT * FROM profiles WHERE id = '00000000-0000-0000-0000-000000000000';
SELECT * FROM ingredient_categories; 