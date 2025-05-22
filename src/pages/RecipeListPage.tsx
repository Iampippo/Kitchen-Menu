import React, { useState, useEffect } from 'react';
import { Search, Filter, Star, Clock, ChevronDown, Heart, Plus } from 'lucide-react';
import { useNavigate } from 'react-router-dom';
import Header from '../components/Header';
import BottomNavigation from '../components/BottomNavigation';
import { getAllRecipes, toggleFavorite, calculateMissingIngredients } from '../services/recipeService';
import { getUserIngredientNames } from '../services/ingredientService';
import { useAuth } from '../contexts/AuthContext';
import { Recipe } from '../types';
import { toast } from 'react-hot-toast';

const RecipeListPage: React.FC = () => {
  const navigate = useNavigate();
  const [activeCategory, setActiveCategory] = useState('all');
  const [showFilter, setShowFilter] = useState(false);
  const [recipes, setRecipes] = useState<Recipe[]>([]);
  const [filteredRecipes, setFilteredRecipes] = useState<Recipe[]>([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [loading, setLoading] = useState(true);
  const { user } = useAuth();
  
  // 菜谱分类
  const categories = [
    { id: 'all', name: '全部' },
    { id: 'quick', name: '快手菜', color: 'bg-red-100 text-red-600' },
    { id: 'lowcal', name: '低卡饮食', color: 'bg-blue-100 text-blue-600' },
    { id: 'balanced', name: '营养均衡', color: 'bg-yellow-100 text-yellow-600' },
    { id: 'protein', name: '高蛋白', color: 'bg-purple-100 text-purple-600' },
    { id: 'vegetarian', name: '素食', color: 'bg-green-100 text-green-600' },
    { id: 'seafood', name: '海鲜', color: 'bg-cyan-100 text-cyan-600' },
    { id: 'Chinese', name: '中式料理', color: 'bg-orange-100 text-orange-600' },
    { id: 'Western', name: '西式料理', color: 'bg-pink-100 text-pink-600' }
  ];
  
  // 筛选选项
  const filterOptions = [
    { id: 'cookable', name: '当前可做', icon: '✓' },
    { id: 'time_under_15', name: '15分钟内', icon: '⏱' },
    { id: 'favorite', name: '我的收藏', icon: '♥' },
    { id: 'rating', name: '评分最高', icon: '★' }
  ];
  
  // 获取菜谱数据
  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      try {
        console.log("开始获取菜谱数据，用户状态:", user ? "已登录" : "未登录");
        let fetchedRecipes: Recipe[] = [];
        
        if (user) {
          // 获取用户库存中的食材名称
          const userIngredients = await getUserIngredientNames(user.id);
          console.log("获取到用户库存食材:", userIngredients);
          
          // 获取所有菜谱
          fetchedRecipes = await getAllRecipes();
          console.log("获取到菜谱数量:", fetchedRecipes.length);
          
          if (userIngredients && userIngredients.length > 0) {
            // 计算缺失食材
            fetchedRecipes = fetchedRecipes.map(recipe => ({
              ...recipe,
              missing: calculateMissingIngredients(recipe, userIngredients)
            }));
          }
          
          if (fetchedRecipes.length > 0) {
            toast.success(`找到${fetchedRecipes.length}个菜谱`);
          }
        } else {
          // 未登录时使用本地获取的菜谱
          console.log("用户未登录，从API获取所有菜谱");
          fetchedRecipes = await getAllRecipes();
        }
        
        console.log("设置菜谱数据:", fetchedRecipes);
        setRecipes(fetchedRecipes);
        // 初始化时设置过滤后的菜谱为全部菜谱
        setFilteredRecipes(fetchedRecipes);
      } catch (error) {
        console.error('Error fetching recipes:', error);
        toast.error("获取菜谱失败");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [user]);

  // 处理搜索和过滤
  useEffect(() => {
    if (recipes.length === 0) return;
    
    console.log("处理搜索和过滤，菜谱总数:", recipes.length);
    let results = [...recipes]; // 创建副本避免直接修改
    
    // 应用搜索过滤
    if (searchTerm) {
      results = results.filter(recipe => 
        recipe.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        recipe.tags.some(tag => tag.toLowerCase().includes(searchTerm.toLowerCase())) ||
        recipe.ingredients.some(ing => ing.toLowerCase().includes(searchTerm.toLowerCase()))
      );
    }
    
    // 应用分类过滤
    if (activeCategory !== 'all') {
      if (activeCategory === 'cookable') {
        results = results.filter(recipe => {
          // 确保missing属性存在并且长度为0
          return recipe.missing && recipe.missing.length === 0;
        });
      } else if (activeCategory === 'favorite') {
        results = results.filter(recipe => recipe.favorite);
      } else {
        results = results.filter(recipe => recipe.tags.includes(activeCategory));
      }
    }
    
    console.log("过滤后的菜谱数量:", results.length);
    setFilteredRecipes(results);
  }, [searchTerm, activeCategory, recipes]);
  
  // 切换收藏状态
  const handleFavoriteToggle = async (id: string) => {
    if (!user) {
      toast.error("请先登录再收藏菜谱");
      return;
    }
    
    const recipe = recipes.find(r => r.id === id);
    if (!recipe) return;
    
    const newFavoriteStatus = !recipe.favorite;
    
    // 调用API更新收藏状态
    const success = await toggleFavorite(id, newFavoriteStatus);
    
    if (success) {
      // 更新本地状态
      const updatedRecipes = recipes.map(recipe => 
        recipe.id === id ? { ...recipe, favorite: newFavoriteStatus } : recipe
      );
      setRecipes(updatedRecipes);
      toast.success(newFavoriteStatus ? "已添加到收藏" : "已从收藏中移除");
    } else {
      toast.error("更新收藏状态失败");
    }
  };
  
  // 添加食材到购物清单
  const addToShoppingList = (items: string[]) => {
    // 实际应用中这里会调用API添加到购物清单
    console.log(`Add ${items.join(', ')} to shopping list`);
    toast.success("已添加到购物清单");
  };

  return (
    <div className="bg-gray-50 min-h-screen font-sans pb-20">
      <Header 
        title="菜谱" 
        showFilter={true}
        onFilterToggle={() => setShowFilter(!showFilter)}
      />
      
      {/* 搜索栏 */}
      <div className="bg-gray-100 px-4 py-2">
        <div className="w-full max-w-3xl mx-auto">
          <div className="relative flex items-center">
            <Search size={18} className="absolute left-3 text-gray-400" />
            <input
              type="text"
              placeholder="搜索菜谱、食材或标签..."
              className="w-full pl-10 pr-4 py-2 bg-white rounded-full border border-gray-200 focus:outline-none focus:ring-2 focus:ring-indigo-200"
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>
        </div>
      </div>
      
      {/* 筛选选项 - 可折叠 */}
      {showFilter && (
        <div className="bg-white px-4 py-3 border-t border-gray-100 shadow-sm">
          <div className="w-full max-w-3xl mx-auto">
            <h3 className="text-sm font-medium text-gray-700 mb-2">筛选</h3>
            <div className="flex flex-wrap gap-2 mb-2">
              {filterOptions.map((option) => (
                <button
                  key={option.id}
                  className={`${
                    activeCategory === option.id
                      ? 'bg-indigo-500 text-white'
                      : 'bg-gray-100 hover:bg-gray-200 text-gray-700'
                  } px-3 py-1 rounded-full text-sm flex items-center`}
                  onClick={() => setActiveCategory(option.id)}
                >
                  <span className="mr-1">{option.icon}</span>
                  {option.name}
                </button>
              ))}
            </div>
            
            <div className="flex justify-between items-center mt-2">
              <h3 className="text-sm font-medium text-gray-700">排序方式</h3>
              <div className="flex items-center text-sm text-gray-500">
                <span>推荐优先</span>
                <ChevronDown size={16} className="ml-1" />
              </div>
            </div>
          </div>
        </div>
      )}
      
      {/* 分类标签 */}
      <div className="bg-white px-4 py-2 border-t border-gray-100">
        <div className="w-full max-w-3xl mx-auto">
          <div className="flex overflow-x-auto py-1 gap-2 no-scrollbar">
            {categories.map((category) => (
              <button
                key={category.id}
                className={`px-3 py-1 rounded-full text-sm whitespace-nowrap ${
                  activeCategory === category.id
                    ? category.id === 'all'
                      ? 'bg-indigo-500 text-white'
                      : category.color
                    : 'bg-gray-100 text-gray-600'
                }`}
                onClick={() => setActiveCategory(category.id)}
              >
                {category.name}
              </button>
            ))}
          </div>
        </div>
      </div>
      
      {/* 主内容区 */}
      <main className="w-full max-w-3xl mx-auto px-4 py-4">
        {/* 加载状态 */}
        {loading && (
          <div className="flex justify-center items-center p-8">
            <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-indigo-500"></div>
          </div>
        )}
        
        {/* 无结果提示 */}
        {!loading && filteredRecipes.length === 0 && (
          <div className="text-center py-8 bg-white rounded-xl shadow-sm">
            <div className="text-gray-500">没有找到符合条件的菜谱</div>
          </div>
        )}
        
        {/* 菜谱网格 */}
        {!loading && filteredRecipes.length > 0 && (
          <div className="grid grid-cols-2 gap-4">
            {filteredRecipes.map((recipe) => (
              <div 
                key={recipe.id} 
                className="bg-white rounded-xl shadow-sm overflow-hidden cursor-pointer"
                onClick={() => navigate(`/recipe/${recipe.id}`)}
              >
                {/* 菜谱图片 */}
                <div className="relative h-36 bg-gray-200">
                  <div className="w-full h-full bg-gradient-to-br from-indigo-100 to-indigo-200 flex items-center justify-center">
                    {recipe.image ? (
                      <img 
                        src={`/images/recipes/${recipe.image}.jpg`} 
                        alt={recipe.name}
                        className="w-full h-full object-cover"
                        onError={(e) => {
                          const target = e.target as HTMLImageElement;
                          target.src = '/images/recipe-placeholder.jpg';
                        }}
                      />
                    ) : (
                      <span className="text-indigo-400 font-medium">{recipe.name}</span>
                    )}
                  </div>
                  
                  {/* 收藏按钮 */}
                  <button 
                    className="absolute top-2 right-2 w-8 h-8 rounded-full bg-white/70 flex items-center justify-center"
                    onClick={(e) => {
                      e.stopPropagation();
                      handleFavoriteToggle(recipe.id);
                    }}
                  >
                    <Heart
                      size={18}
                      className={recipe.favorite ? "text-red-500" : "text-gray-400"}
                      fill={recipe.favorite ? "currentColor" : "none"}
                    />
                  </button>
                  
                  {/* 可做状态标签 */}
                  <div className="absolute bottom-2 left-2">
                    <div className={`px-2 py-0.5 rounded-full text-xs ${
                      recipe.missing && recipe.missing.length === 0
                        ? 'bg-green-500 text-white'
                        : 'bg-amber-100 text-amber-700'
                    }`}>
                      {recipe.missing && recipe.missing.length === 0 ? '可以做' : '缺少食材'}
                    </div>
                  </div>
                </div>
                
                {/* 菜谱信息 */}
                <div className="p-3">
                  <h3 className="font-medium text-gray-800 mb-1">{recipe.name}</h3>
                  
                  <div className="flex items-center text-xs text-gray-500 mb-2">
                    <Clock size={12} className="mr-1" />
                    <span>{recipe.totalTime}</span>
                    <span className="mx-1">•</span>
                    <span>{recipe.difficulty}</span>
                  </div>
                  
                  {/* 评分 */}
                  <div className="flex justify-between items-center">
                    <div className="flex items-center">
                      <Star size={14} className="text-yellow-400" fill="currentColor" />
                      <span className="text-xs ml-1 text-gray-600">{recipe.rating || 4.5} ({recipe.reviewCount || 0})</span>
                    </div>
                    
                    {/* 如果缺少食材，显示"添加到购物清单"按钮 */}
                    {recipe.missing && recipe.missing.length > 0 && (
                      <button 
                        className="text-xs bg-amber-50 text-amber-700 px-2 py-1 rounded-full flex items-center"
                        onClick={(e) => {
                          e.stopPropagation();
                          addToShoppingList(recipe.missing);
                        }}
                      >
                        <Plus size={12} className="mr-1" />
                        <span>购物清单</span>
                      </button>
                    )}
                  </div>
                </div>
              </div>
            ))}
          </div>
        )}
      </main>
      
      <BottomNavigation />
    </div>
  );
};

export default RecipeListPage;