# 扩充菜谱库脚本使用说明

本目录包含用于扩充Kitchen Helper应用菜谱库的实用脚本。

## 文件说明

- `convert_csv_to_sql.js` - 将CSV格式的菜谱数据转换为SQL插入语句
- `../sql/import_recipes.sql` - 包含将数据导入到Supabase数据库的SQL逻辑

## 使用步骤

### 1. 准备CSV文件

确保以下CSV文件已放置在`kitchen_seeds_csv`目录中：
- `01_ingredients_au.csv` - 食材数据
- `02_recipes_cn_west.csv` - 菜谱基本信息
- `03_recipe_items.csv` - 菜谱与食材的关联数据

### 2. 安装依赖

首次使用需要安装Node.js依赖：

```bash
npm install csv-parse
```

### 3. 生成SQL插入语句

运行以下命令将CSV数据转换为SQL语句：

```bash
node scripts/convert_csv_to_sql.js
```

这将在`sql`目录下生成`generated_inserts.sql`文件。

### 4. 导入到Supabase

有两种方法将生成的SQL导入到Supabase：

#### 方法1：使用Supabase SQL编辑器

1. 登录Supabase管理界面
2. 打开SQL编辑器
3. 复制并粘贴`generated_inserts.sql`的内容
4. 执行SQL语句

#### 方法2：使用supabase-js客户端

通过Supabase的RPC调用执行SQL：

```javascript
import { supabase } from '../src/supabaseClient';

// 读取SQL文件内容
const sqlContent = readFileSync('./sql/generated_inserts.sql', 'utf-8');

// 执行SQL
const { data, error } = await supabase.rpc('exec_sql', { sql: sqlContent });

if (error) {
  console.error('导入失败:', error);
} else {
  console.log('导入成功:', data);
}
```

注意：此方法需要在Supabase中创建一个`exec_sql`的存储过程，并为其设置适当的权限。

### 5. 验证导入结果

导入完成后，可以通过以下SQL查询验证导入结果：

```sql
-- 检查新增食材数量
SELECT COUNT(*) FROM ingredients WHERE user_id = '00000000-0000-0000-0000-000000000000';

-- 检查新增菜谱数量
SELECT COUNT(*) FROM recipes;

-- 检查菜谱-食材关系数量
SELECT COUNT(*) FROM recipe_ingredients;
```

## 注意事项

- 确保CSV文件格式正确，字段名与脚本中预期的一致
- 导入过程会跳过已存在的食材和菜谱，避免重复数据
- 执行SQL语句需要数据库管理员权限
- 建议在导入前备份数据库 