# 厨房助手 - 菜谱导入指南

本指南将帮助您导入菜谱、食材和相关数据到Supabase数据库。

## 选择导入方法

我们提供了两种导入菜谱数据的方法：

### 方法一：直接在Supabase控制台执行SQL脚本（推荐）

这是最简单的方法，只需在Supabase控制台中执行一个SQL脚本。

1. 登录您的Supabase控制台：https://fisrtghcvoxnznkysjsl.supabase.co
2. 点击左侧菜单的"SQL编辑器"选项
3. 创建新查询
4. 复制下面的SQL文件内容到编辑器：
   - `sql/all_in_one_import.sql`
5. 点击"运行"按钮执行导入
6. 等待导入完成，查看结果输出

### 方法二：使用Node.js脚本导入

如果您希望在本地执行导入，可以使用提供的Node.js脚本。

#### 前提条件

- 安装Node.js（v16或更高版本）
- 获取Supabase服务角色API密钥

#### 导入步骤

1. 打开终端或命令提示符
2. 导航到项目目录：`cd path/to/Kitchen\ menu/`
3. 进入导入脚本目录：`cd scripts/supabase`
4. 安装依赖：`npm install`
5. 设置Supabase密钥（使用下面任一方式）：

   **方法A - 命令行参数：**
   ```bash
   npm run import:direct eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpc3J0Z2hjdm94bnpua3lzanNsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzAxMjI0MSwiZXhwIjoyMDYyNTg4MjQxfQ.igzO9cU976axEqewJZInHqJDG5Gx1YP9odNdL8LjxD4
   ```

   **方法B - 环境变量：**
   ```bash
   # Linux/Mac
   export SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpc3J0Z2hjdm94bnpua3lzanNsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzAxMjI0MSwiZXhwIjoyMDYyNTg4MjQxfQ.igzO9cU976axEqewJZInHqJDG5Gx1YP9odNdL8LjxD4
   npm run import:direct
   
   # Windows(CMD)
   set SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpc3J0Z2hjdm94bnpua3lzanNsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzAxMjI0MSwiZXhwIjoyMDYyNTg4MjQxfQ.igzO9cU976axEqewJZInHqJDG5Gx1YP9odNdL8LjxD4
   npm run import:direct
   ```

## 导入内容说明

导入脚本将向数据库添加以下内容：

1. **基础数据**
   - 系统用户 (`profiles` 表)
   - 食材分类 (`ingredient_categories` 表)

2. **食材库存**
   - 蔬菜、肉类、调料等食材 (`ingredients` 表)
   - 包括不同类型：食材、调味料、工具等

3. **菜谱数据**
   - 中式和西式菜谱 (`recipes` 表)
   - 菜谱标签 (`recipe_tags` 表)
   - 菜谱步骤 (`recipe_steps` 表)

4. **菜谱-食材关系**
   - 每个菜谱所需的食材及用量 (`recipe_ingredients` 表)

## 故障排除

如果在导入过程中遇到问题，请尝试以下解决方案：

1. **数据库连接错误**
   - 检查Supabase URL和API密钥是否正确
   - 确保使用服务角色(service_role)密钥而非匿名密钥

2. **权限错误**
   - 在Supabase控制台中创建`exec_sql`函数
   - 脚本已包含创建此函数的逻辑，但如果失败，可以手动创建

3. **重复数据**
   - 导入脚本设计为可重复执行，会自动跳过已存在的记录
   - 如需完全重置，可以先清空相关表数据

## 验证导入结果

导入完成后，您可以在Supabase控制台或应用中验证数据是否正确导入：

1. 在Supabase控制台查看表数据
2. 在应用中查看菜谱和食材是否显示
3. 检查食材分类是否正确应用 