droplet 命令工具可以帮助开发者根据实体模型(.cs文件)生成常用的代码模板，包括：
- Dto文件，增加、更新、查询、列表等Dto文件
- 仓储文件，数据仓储层代码
- 控制器文件

对于前端，可以根据swagger OpenApi的json内容，生成请求所需要的代码(.ts)，包括：
- 请求服务,`xxx.service.ts`
- 接口模型,`xxx.ts`

默认支持[ater.web.templates](https://www.nuget.org/packages/ater.web.templates)项目模板，建议配合使用。
