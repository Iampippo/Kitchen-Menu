# Kitchen Helper App 项目全景说明文档

**版本号：v0.0.1**

## 一、项目简介

Kitchen Helper App 是一个帮助用户管理家庭食材库存、智能推荐菜谱的 Web 应用。项目已完成从 mockData 到 Supabase 实时数据库的迁移，支持用户注册、登录、食材管理、菜谱推荐等核心功能。

### 当前已实现功能
- 用户注册、登录、退出
- 浏览系统食材库（含分类、单位等信息）
- 添加、编辑、删除个人食材库存
- 食材库存数量调整
- 食材分类筛选
- 基于个人库存的菜谱智能推荐
- 菜谱详情展示（所需食材、步骤）
- 自动生成购物清单
- 前端与Supabase数据库实时同步
- 权限与RLS策略配置（系统食材所有用户可读，个人库存仅本人可读写）
- 支持多端口自动切换，热更新
- CSV导入批量扩充菜谱库（新增）

---

## 二、技术栈与主要依赖

- **前端框架**：React + TypeScript
- **构建工具**：Vite (v5.4.8)
- **UI 框架**：TailwindCSS
- **对话框组件**：@headlessui/react
- **状态管理**：React Context
- **数据库**：Supabase（PostgreSQL，含 RLS 权限控制）
- **构建&辅助工具**：csv-parse（用于CSV数据处理）
- **AI 协作**：Claude（UI原型设计）、Cursor（代码实现）

---

## 三、项目结构

```
Kitchen menu/
├── src/
│   ├── components/           # 复用UI组件
│   │   ├── BottomNavigation.tsx
│   │   ├── InventoryDisplay.tsx
│   │   ├── RecipeCard.tsx
│   │   └── ...
│   ├── contexts/             # React Context
│   │   ├── AuthContext.tsx
│   │   ├── InventoryContext.tsx
│   │   └── ...
│   ├── data/                 # 静态数据（部分已弃用）
│   │   ├── mockData.ts
│   │   ├── ingredientCategories.ts
│   │   └── ...
│   ├── pages/                # 页面组件
│   │   ├── HomePage.tsx
│   │   ├── InventoryPage.tsx
│   │   ├── RecipeDetailPage.tsx
│   │   ├── ShoppingListPage.tsx
│   │   ├── UserProfilePage.tsx
│   │   └── ...
│   ├── App.tsx               # 路由与主入口
│   └── index.css             # 全局样式
├── package.json              # 依赖与脚本
└── ...
```

---

## 四、数据库设计（Supabase）

### 核心数据表

- **ingredients**：系统食材库（包含名称、单位、分类等）
- **ingredient_categories**：食材分类表（蔬菜、肉类、调味料等）
- **recipes**：菜谱主表（名称、描述、难度、烹饪时间等）
- **recipe_ingredients**：菜谱食材关联表（记录菜谱所需的食材及用量）
- **recipe_steps**：菜谱步骤表（详细烹饪步骤及操作）
- **recipe_tags**：菜谱标签表（菜系、难度、特色等标签）
- **recipe_tips**：菜谱小贴士表（烹饪提示和技巧）
- **recipe_pairings**：菜谱搭配表（推荐搭配的其他菜品）

### 用户相关表

- **profiles**：用户档案表（由Supabase Auth关联，存储用户个性化信息）
- **cooking_history**：用户烹饪历史记录（记录用户烹饪过的菜品）
- **cooking_templates**：烹饪模板（基础烹饪方法模板）
- **milestones**：用户成就里程碑（完成特定烹饪任务的记录）
- **user_stats**：用户统计数据（烹饪频率、擅长菜系等）

### 权限与安全
- 所有表均启用 Row Level Security (RLS)
- ingredients 表：所有已登录用户可读
- profiles 相关表：仅各自用户可读写
- 通过 Supabase 控制台手动设置策略

---

## 五、主要功能

1. **用户认证**：注册、登录、退出
2. **食材管理**：
   - 浏览系统食材库
   - 添加/编辑/删除个人库存
   - 分类筛选
3. **菜谱推荐**：
   - 基于用户库存智能推荐
   - 支持库存为零的特殊处理
4. **菜谱详情**：查看所需食材与步骤
5. **购物清单**：自动生成待购食材列表

---

## 六、开发与协作流程

### 1. 需求与原型设计
- 用户用自然语言与 Claude 交流，描述需求和UI原型
- Claude 输出UI草图、页面结构、交互流程

### 2. 代码实现
- 用户在 Cursor 中编程，AI辅助生成/修改代码
- 代码与Supabase数据库实时对接

### 3. 数据库与权限
- 用户手动在 Supabase 控制台创建表、字段、RLS策略
- 某些AI无法自动完成的操作（如SQL脚本、策略设置）由用户手动执行

### 4. 问题追踪与解决
- 通过npm run dev本地启动，调试前端
- 遇到依赖缺失、端口占用、热更新异常等问题，及时修复
- 典型问题如mockData与UUID不兼容、@headlessui/react未安装、vite热更新报错等，均已解决

---

## 七、遇到的主要问题与解决方法

| 问题 | 解决方法 |
|------|----------|
| mockData与Supabase UUID不兼容 | 全部切换为Supabase数据，前端ID类型统一 |
| ingredients表结构不全 | 增加unit、category_id等字段 |
| RLS权限导致数据无法访问 | 手动配置Supabase策略，调试通过 |
| @headlessui/react未安装 | npm install @headlessui/react 解决 |
| vite热更新报错（export不兼容） | 检查Context导出方式，确保唯一默认导出或命名导出一致 |
| npm start无效 | 使用npm run dev启动开发环境 |
| 端口占用 | Vite自动切换端口，正常启动 |

---

## 八、环境搭建与运行

1. **克隆项目**
   ```bash
   git clone <repo-url>
   cd "Kitchen menu"
   ```

2. **安装依赖**
   ```bash
   npm install
   ```

3. **开发环境启动**
   ```bash
   npm run dev
   ```
   - Vite会自动选择可用端口（如5173、5174等）
   - 浏览器访问 http://localhost:517x/

4. **数据库配置**
   - 在Supabase控制台创建项目
   - 建立表结构，导入系统食材
   - 配置RLS策略，确保权限正确

5. **环境变量**
   - 在项目根目录添加`.env`文件，配置Supabase URL和API KEY

---

## 九、工作方式与AI协作说明

- **需求沟通**：用户用自然语言与Claude沟通，Claude负责理解需求、输出UI原型和交互建议
- **代码实现**：Cursor AI辅助编程，用户主导代码结构和业务逻辑
- **数据库与权限**：用户手动在Supabase控制台完成表结构和权限设置
- **AI能力边界**：AI可辅助代码、文档、部分配置，数据库实际操作和策略需人工介入
- **问题记录**：所有遇到的问题和解决方法均有详细记录，便于新AI或开发者查阅

---

## 十、后续建议与待办事项

- **性能优化**：数据缓存、减少不必要的请求
- **用户体验**：完善加载指示、错误提示
- **功能扩展**：食材保质期提醒、购物清单自动生成、个性化推荐
- **代码质量**：重构通用组件、完善类型定义、增加单元测试
- **部署上线**：配置CI/CD、监控与备份

---

## 十一、其他注意事项

- **所有依赖需通过npm/yarn安装，部分依赖如@headlessui/react需手动补充**
- **Supabase相关操作（如表结构、RLS策略）需在控制台手动完成，AI仅能给出建议和SQL模板**
- **如遇到Vite热更新或端口占用，直接重启或等待自动切换端口即可**
- **如需迁移到生产环境，需重新配置Supabase密钥和域名**

---

## 十二、交接说明

本项目已实现mock数据到Supabase的全面迁移，所有核心功能可用，权限与数据结构清晰。  
本说明文档涵盖了项目结构、技术选型、开发流程、AI协作方式、常见问题与解决、环境搭建、后续建议等所有关键信息。  
新AI或开发者可据此文档快速上手并继续开发。

---

如需进一步细节（如表结构SQL、RLS策略SQL、页面UI草图等），可随时补充。

## 七、数据导入工具

项目新增了CSV数据导入工具，用于批量扩充菜谱库：

### 1. 工具位置

- `scripts/convert_csv_to_sql.js` - CSV转SQL脚本
- `sql/import_recipes.sql` - SQL导入逻辑
- `kitchen_seeds_csv/` - CSV数据目录

### 2. 支持的CSV格式

支持导入三种CSV文件：
- 食材文件（格式：name,type,default_unit,category,note）
- 菜谱文件（格式：title,intro_md,cuisine,difficulty,est_minutes）
- 菜谱食材关系（格式：recipe_title,item_name,qty,unit）

### 3. 使用方法

#### 方法一：CLI自动同步（推荐）

1. 将CSV文件放入`kitchen_seeds_csv/`目录
2. 安装依赖：`npm install`
3. 运行同步命令：`npm run sync-recipes`
4. 按提示输入Supabase URL和密钥
5. 确认导入并等待完成

#### 方法二：手动SQL导入

1. 将CSV文件放入`kitchen_seeds_csv/`目录
2. 安装依赖：`npm install csv-parse`
3. 运行转换脚本：`node scripts/convert_csv_to_sql.js`
4. 在Supabase管理界面的SQL编辑器中执行生成的SQL文件

详细使用说明请参考：
- `scripts/README.md`（脚本使用指南）
- `scripts/SYNC_README.md`（自动同步工具使用指南）
- `sql/README.md`（SQL导入指南）

## 十一、后续开发建议

1. **菜谱库扩充**：
   - 现已实现通过CSV批量导入菜谱功能
   - 可进一步开发用户提交自定义菜谱功能
   - 考虑使用AI生成菜谱步骤和描述，提高数据质量
