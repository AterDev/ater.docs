# Http.API

Rest API实现，是Web项目的运行项目，与普通的`ASP.NET Core`项目没什么区别。

## csproj项目配置

本模板项目配置，与正常的`ASP.NET Core`项目没什么不同，只是加入了集成前端的功能，如果你不需要，可以删除.

```xml
  <SpaRoot>ClientApp\</SpaRoot>
  <SpaProxyServerUrl>https://localhost:14200</SpaProxyServerUrl>
```

以及

```xml
 <ItemGroup>
  <PackageReference Include="Microsoft.AspNetCore.SpaProxy" Version="7.0.5" />
 </ItemGroup>
```

## Program.cs

Program是`ASP.NET Core`中极其重要的入口类，在这里我们需要完成`配置`,`服务注入`,`中间件`等各类准备工作。

本模板默认配置了以下内容：

- 数据库，默认使用`PostgreSQL`
- Redis缓存，参照官方[分布式缓存](https://learn.microsoft.com/zh-cn/aspnet/core/performance/caching/distributed?view=aspnetcore-7.0#distributed-redis-cache)
- 日志监测[OpenTelemetry](https://opentelemetry.io/docs/instrumentation/net/)
- Jwt授权配置
- Authorization Policy
- CORS跨域配置
- Swagger 配置
- Json全局配置
- 统一异常处理,`app.UseExceptionHandler`
- 自定义400返回结构,`CustomBadRequest`
- 初始化任务`InitDataTask`
- 集成前端Angular项目配置

可以根据实际需求自由替换。

## Middleware

自定义中间件实现

## Migrations

EF Core 生成的迁移文件

## Worker

定义后台任务服务

## 建议及约定

整体使用RESTful风格，优先使用`ASP.NET Core`框架本身提供的功能。

### 请求方式

- GET，获取数据时使用GET，复杂的筛选和条件查询，可改用POST方式传递参数。
- POST，添加数据时使用POST。主体参数使用JSON格式。
- PUT，修改数据时使用PUT。主体参数使用JSON格式。
- DELETE，删除数据时使用DELETE。

### 请求返回

返回以HTTP状态码为准。

- 200，执行成功。
- 201，创建成功。
- 401，未验证，没有传递token或token已失效。需要重新获取token(登录)。
- 403，禁止访问，指已登录的用户但没有权限访问。
- 404，请求的资源不存在。
- 409，资源冲突。
- 500，错误返回，服务器出错或业务错误封装。

错误返回的格式如下：

```json
{
  "title": "",
  "status": 500,
  "detail": "未知的错误！",
  "traceId": "00-d768e1472decd92538cdf0a2120c6a31-a9d7310446ea4a3f-00"
}
```

### ASP.NET Core 请求返回示例

1. 路由定义，约定使用HTTP谓词
请参见 [**HTTP谓词模板**](https://docs.microsoft.com/aspnet/core/mvc/controllers/routing?view=aspnetcore-6.0#http-verb-templates)。
2. **模型绑定**，可使用`[Frombody]`以及`[FromRoute]`指明请求来源，
参见[**请求来源**](https://docs.microsoft.com/aspnet/core/mvc/models/model-binding?view=aspnetcore-6.0#sources)，如：

```csharp
// 修改信息
[HttpPut("{id}")]
public async Task<ActionResult<TEntity?>> UpdateAsync([FromRoute] Guid id, TUpdate form)
```

> [!NOTE]
> 不建议在接口方法中使用`[Route()]`来定义方法的路由，请使用更直观和明确的HTTP谓词方式。

3. 返回类型，请使用[ActionResult&#60;T&#62;或特定类型](https://docs.microsoft.com/aspnet/core/web-api/action-return-types?view=aspnetcore-6.0#actionresult-vs-iactionresult)作为返回类型。

- 正常返回，可直接返回特定类型数据。
- 错误返回,使用Problem()，如：

```csharp
// 如果错误，使用Problem返回内容
return Problem("未知的错误！", title: "业务错误");
```

- 404，使用NotFound()，如：

```csharp
// 如果不存在，返回404
return NotFound("用户名密码不存在");
```

> [!NOTE]
> 不建议使用统一的自定义返回模型，请优先使用HTTP状态码表达返回的含义。
> 如需要自定义错误码，也可通过添加模型字段，而不是使用统一的返回类型。
