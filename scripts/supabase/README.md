# 厨房助手 - 数据导入脚本

这是一个用于将菜谱、食材和它们之间的关系导入到Supabase数据库的脚本。

## 前提条件

- Node.js 16+ 版本
- Supabase项目，包含必要的表结构
- Supabase服务角色API密钥

## 使用方法

### 1. 安装依赖

```bash
cd scripts/supabase
npm install
```

### 2. 设置环境变量

使用以下任一方式设置环境变量：

**方法1: 命令行方式**

```bash
# Linux/Mac
export SUPABASE_URL=https://fisrtghcvoxnznkysjsl.supabase.co
export SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# Windows (CMD)
set SUPABASE_URL=https://fisrtghcvoxnznkysjsl.supabase.co
set SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...

# Windows (PowerShell)
$env:SUPABASE_URL="https://fisrtghcvoxnznkysjsl.supabase.co"
$env:SUPABASE_KEY="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
```

**方法2: 在命令中直接添加**

```bash
SUPABASE_URL=https://fisrtghcvoxnznkysjsl.supabase.co SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9... npm run import
```

### 3. 运行导入脚本

```bash
npm run import
```

## SQL脚本说明

本工具使用以下SQL脚本:

1. `ingredients_categories_setup.sql` - 设置系统用户和食材分类
2. `inventory_import.sql` - 导入食材库存
3. `simple_import.sql` - 导入菜谱数据
4. `recipe_ingredients_import.sql` - 导入菜谱和食材的关系

## 注意事项

- 使用前请确保在Supabase控制台中启用RPC函数`exec_sql`
- 此脚本需要服务角色(service_role)的API密钥才能执行SQL操作
- 导入脚本会自动跳过已经存在的记录，可以安全地多次运行

## 常见问题

1. **连接错误**: 检查URL和API密钥是否正确
2. **权限问题**: 确保使用服务角色API密钥，而不是匿名密钥
3. **执行SQL错误**: 检查是否已创建`exec_sql`函数，可通过Supabase SQL编辑器运行以下脚本:

```sql
CREATE OR REPLACE FUNCTION exec_sql(sql_query text)
RETURNS json
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
BEGIN
  EXECUTE sql_query;
  RETURN json_build_object('success', true);
EXCEPTION
  WHEN OTHERS THEN
    RETURN json_build_object('success', false, 'error', SQLERRM);
END;
$$;
```

## 替代方案

如果无法使用此脚本导入数据，您可以直接在Supabase SQL编辑器中执行以下脚本:

- `sql/all_in_one_import.sql` - 一体化导入脚本，包含所有内容 