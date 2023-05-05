# 常见问题

## 1. 如何访问数据库上下文？

### 在控制器访问数据库上下文

你可以直接注入`数据库上下文`服务，如`ContextBase`，然后在控制器中使用，这与普通的`ASP.NET Core`应用没有区别！
> [!WARNING]
> 请保持控制器中代码的整洁，建议通过`Manager`实现业务，然后在控制器中调用，通常你不应该在控制器中直接访问`数据库上下文`。

### 在`Manager`访问数据库上下文

在某些情况下，你需要在`Manager` 操作其他实体，通常情况下，你可以通过注入**其他实体**的`Manager`，然后调用相关的方法。

如果你需要保持在同一个工作单元（事务），`Manager`提供了成员变量：

```csharp
/// <summary>
/// 实体仓储上下文
/// </summary>
public DataStoreContext Stores { get; init; }

/// <summary>
/// 实体的只读仓储实现
/// </summary>
public QuerySet<TEntity> Query { get; init; }
/// <summary>
/// 实体的可写仓储实现
/// </summary>
public CommandSet<TEntity> Command { get; init; }

```

可用来访问其他实体的仓储以及数据库上下文，如：

- `Stores.CommandContext`， 等同于`Command.Context`，可写数据库上下文。
- `Stores.QueryContext`，等同于`Query.Context`，只读数据库上下文。

## 2. 如何访问在实体对应的DbSet对象

在`Manager`中，可以直接使用`EF Core`提供的公开`Db`变量进行操作，如:

```csharp
// 可写数据库 对应的实体
Command.Db.Where(u => u.Name == "").Include(u => u.Attributes).ToList();
// 只读数据库 对应的实体
Query.Db.Where(u => u.Name == "").Include(u => u.Attributes).ToList();

```

## 3. 如何控制软删除

### 全局配置

删除默认为软删除，如果想修改该行为，可在`CommandStoreBase`类中将`EnableSoftDelete`设置为false.

### 单个配置

如果只想针对某个实体取消，可在实体对应的`XXXCommandStore`类中，覆盖`EnableSoftDelete`，将其设置为false.
