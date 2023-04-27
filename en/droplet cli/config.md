## Description of the method
Configuration management, mainly providing project directory management.

## Edit the configuration
`droplet config edit`  
Modify the configuration file.

## Initialize the configuration
`droplet config init`  
If you are prompted that the configuration file cannot be found, you can use this command to initialize the configuration file.

## Configuration items
The configuration file is a 'json' format file with the following content:
```json
{
  "RootPath": "./",     // 项目根目录
  "DtoPath": "Share",   // dto输出目录
  "EntityPath": "Core", // 实体项目目录
  "DbContextPath": "Database/EntityFramework",
  "StorePath": "Http.Application",  // 数据仓储输出目录
  "ApiPath": "Http.API",            // 控制器接口输出目录
  "IdStyle": "Id",                  // 默认Id字段名称
  "IdType": "Guid",                 // 生成Id使用的类型，如string,Guid,int
  "CreatedTimeName": "CreatedTime", // 默认创建时间字段名称
  "UpdatedTimeName": "UpdatedTime"  // 默认更新时间字段名称
}

```
