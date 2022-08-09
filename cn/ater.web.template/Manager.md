# 说明
`Manager`意为`业务对象管理者`，在实际开发中，我们对业务对象的操作通常会封装在该类中。

## 实践

### 定义业务接口
`cli工具`会为实体对象自动生成对应的`接口文件`以及`实现类`。
开发者需要根据自己的业务需求，在`接口文件`中定义相应的接口方法。

典型例子，如`用户修改密码`，那么`接口文件`看起来应该是:

```csharp
public interface IUserManager : IDomainManager<User, UserUpdateDto, UserFilterDto>
{
    /// <summary>
    /// 修改密码
    /// </summary>
    /// <param name="user"></param>
    /// <param name="newPassword"></param>
    /// <returns></returns>
    Task<bool> ChangePasswordAsync(User user, string newPassword);

}
```

### 实现业务接口
生成的`Manager`会继承`DomainManagerBase`基类，该基类提供一些常见的方法和属性。
你可以重写或使用这些方法来快速实现自己的业务逻辑。

父类提供相关的成员：
```csharp
    /// <summary>
    /// 仓储上下文，可通过Store访问到其他实体的上下文
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
    /// <summary>
    /// 是否自动保存(调用SaveChanges)
    /// </summary>
    public bool AutoSave { get; set; } = true;

```
