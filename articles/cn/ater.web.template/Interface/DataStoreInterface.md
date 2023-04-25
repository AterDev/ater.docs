# 数据仓储接口

## 基础查询接口
定义常规的基础查询方法

### 接口类
`IDataStoreQuery`
### 包含方法

#### id查询一条数据
```csharp
Task<TDto> FindAsync<TDto>(TId id);
```

#### 条件查询一条数据
```csharp
Task<TDto> FindAsync<TDto>(TFilter filter);
```

#### 列表条件查询
```csharp
Task<List<TItem>> ListAsync<TItem>(TFilter filter);
```

#### 分页查询
```csharp
Task<PageList<TItem>> PageListAsync<TItem>(TFilter filter);
```

## 高级查询接口
### 接口类
`IDataStoreQueryExt`

### 方法

#### 筛选排序
```csharp
Task<PageList<TItem>> Filter<TItem>(TFilter filter, Dictionary<string, bool> order);
```

#### 自定义查询
```csharp
Task<PageList<TItem>> Filter<TItem>(Expression<Func<TEntity, bool>> whereExp, Dictionary<string, bool>? order, int? pageIndex = 1, int? pageSize = 12);
 ```

