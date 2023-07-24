# 自定义Manager行为

默认的`Manager`继承了`DomainManagerBase`类，实现了常见的业务逻辑。

默认实现的新增和修改，会直接调用`SaveChangesAsync()`，提交数据库更改。

如果你想更改此行为，可在构造方法中覆盖`AutoSave`属性，如：

``` csharp
/// <summary>
/// 是否自动保存(调用SaveChangesAsync)
/// </summary>
public bool AutoSave { get; set; } = true;
```
