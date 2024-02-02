## 方法说明

生成实体对应的控制器接口文件，相应的控制器所需要的数据仓储文件以及Dto文件也会一并生成。
> 数据仓储的生成依赖于`EntityFramework Core`，需要先创建数据库上下文文件。

## 命令

`droplet webapi <entity path> [options]`
> 别名: `droplet api`

## 参数

- **`entity path`**, 对应实体.cs文件的完整路径，支持绝对路径和相对路径，如`.\Models\User.cs`.
- `--dto`或`-d`，生成的Dto文件存储的目录，默认路径为`[./Share]`。
- `--datastore`或`-s`，生成的仓储文件存储的目录，默认路径为`[./Http.Application]`。
- `--output`或`-o`，生成的控制器文件存储的目录，默认路径为`[./Http.API]`。
- `--contextName`或`-c`，数据库上下文类名,默认为`ContextBase`

## 行为

1. 该命令会在生成相应的控制器、数据仓储、Dto文件，所以需要分别指定相应的目录，如果你没有分层，可以指定同一个目录，相应代码子目录关系：
    - API控制器 =>`Controllers`
    - 数据仓储 => `DataStroe`
    - Dto文件 => `Models`
2. 生成依赖于`EntityFramework Core`,你需要定义数据库上下文，如果你有多个数据库上下文文件，需要指定`类名`，而非文件名。该命令会自动搜索项目中指定类名的数据库上下文。
3. 该命令同时会生成相关的接口文件和扩展方法，方便你在`ASP.NET Core`项目中进行依赖注入。
