# Dto

生成实体对应的DTO文件。

## 命令

`droplet dto <entity path> [options]`

## 参数

- **`entity path`**, 对应实体.cs文件的完整路径，支持绝对路径和相对路径，如`./Entities/User.cs`.
- `--output`或`-o`，生成的dto文件存储的目录，默认路径为`[./Share]`。
- `--force`或`-f`，是否覆盖，默认为`false`。

## 行为

1. 该命令会在指定的`output`目录生成实体对应的文件夹，如实体文件为`User.cs`，则会创建`UserDtos`子文件夹，相应的dtos文件会生成到该目录。
2. 如果已经存在对应的dto，默认是不会新生成，使用`-f`,可以强制覆盖。
