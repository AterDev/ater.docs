# Manager

生成实体对应的业务实现接口和基础实现代码，包含DTO文件。

## 命令

`droplet manager <entity path> [options]`

## 参数

- **`entity path`**, 对应实体.cs文件的完整路径，支持绝对路径和相对路径，如`./Entities/User.cs`.
- `--dto`或`-d`，生成的dto文件存储的目录，默认路径为`[./Share]`。
- `--manager`或`-m`，生成的Manager文件存储的目录，默认路径为`[./Application]`。
- `--force`或`-f`，是否覆盖，默认为`false`。

## 行为

1. 该命令会在指定的目录生成实体对应的业务接口实现和DTO类型，包括一些基础依赖代码。
2. 如果已经存在对应的dto，默认是不会新生成，使用`-f`,可以强制覆盖。
