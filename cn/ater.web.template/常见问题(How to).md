# 问题
## 1. 如何访问数据库上下文？

### 在控制器访问数据库上下文。
我们建议通过`Manager`去实现业务，通常你不应该在控制器中 直接访问`数据库上下文`。
不过我们并没有限制这样去做，你仍然可以 直接注入`数据库上下文`，然后在控制器中使用。

### 在`Manager`访问数据库上下文。
在某些情况下，你需要在`Manager` 操作其他实体，通常情况下，你可以通过注入**其他实体**的`Manager`，然后调用相关的方法。

如果你需要保持在同一个工作单元（事务），`Manager`提供了成员变量：
```csharp
/// <summary>
/// 实体仓储上下文
/// </summary>
public DataStoreContext Stores { get; init; }

```
可用来访问其他实体的仓储以及数据库上下文，如：
- `Stores.CommandContext`， 可写数据库上下文。
- `Stores.QueryContext`，只读数据库上下文。

## 2. 如何访问在实体对应的DbSet对象。
在`Manager`中，可以直接使用`EF Core`提供的`DbSet`进行操作，如:
```csharp
// 可写数据库 对应的实体
Command.Db.Where(u => u.Name == "").Include(u => u.Attributes).ToList();
// 只读数据库 对应的实体
Query.Db.Where(u => u.Name == "").Include(u => u.Attributes).ToList();

```



