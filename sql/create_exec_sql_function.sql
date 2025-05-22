-- 创建exec_sql函数，用于在Supabase中执行动态SQL
-- 此函数通常用于导入数据和其他管理任务

-- 安全性说明：
-- 此函数使用SECURITY DEFINER，意味着它会以创建者的权限执行
-- 因此应该谨慎使用，并限制谁可以调用这个函数

CREATE OR REPLACE FUNCTION exec_sql(sql_query text)
RETURNS json
LANGUAGE plpgsql
SECURITY DEFINER -- 使用创建者的权限
AS $$
BEGIN
  -- 执行传入的SQL查询
  EXECUTE sql_query;
  RETURN json_build_object('success', true);
EXCEPTION
  WHEN OTHERS THEN
    -- 捕获所有异常并返回错误信息
    RETURN json_build_object('success', false, 'error', SQLERRM);
END;
$$;

-- 授予RPC调用权限
GRANT EXECUTE ON FUNCTION exec_sql(text) TO service_role;
REVOKE EXECUTE ON FUNCTION exec_sql(text) FROM anon, authenticated;

-- 说明性查询：如何使用此函数
/*
示例用法:

1. 使用Supabase客户端:
   const { data, error } = await supabase.rpc('exec_sql', { 
     sql_query: 'CREATE TABLE test (id int)' 
   });

2. 在SQL编辑器中测试:
   SELECT exec_sql('SELECT NOW()');
*/ 