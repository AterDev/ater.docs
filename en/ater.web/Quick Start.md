# Quick Start

Precondition: You have installed and created a project template

## Check the configuration file

Templates default to `PostgreSQL` as a relational database and `Redis` as distributed cache support.

You need to configure the connection string in `appsettings.json`and replace the default database if you want.

## Defining Solid Models

- Defining a solid model under an`Entity`project
- Define database context and`DbSet`under`EntityFramework`project

> [!IMPORTANT]
>Please follow the official documentation of`Entity Framework Core`to define models and relationships.

## Generate base code

Use`dry studio` to generate`dto`,`Manager`,`Controller` and other basic code.

> [!TIP]
>For more information about`dry cli`, see[the dry cli documentation.](https://docs.dusi.dev/en/ater.dry/Overview.html)

## Implement custom business logic

Implement business logic in the`Application``Manager`directory, usually including `Filter Query`, `Add Entity`, and `Update Entity`.

### Filter query

Steps to build custom query criteria:

1. Construct your own query condition `Queryable`
2. Call `FilterAsync<T>` method to get results

Code example:

```csharp

public override async Task<PageList<DiscussItemDto>> FilterAsync(DiscussFilterDto filter)
{
    // 根据实际业务构建筛选条件
    if (filter.IsTop != null)
    {
        Queryable = Queryable.Where(q => q.IsTop == filter.IsTop);
    }
    if (filter.MemberId != null)
    {
        Queryable = Queryable.Where(q => q.Member.Id == filter.MemberId);
    }
    return await Query.FilterAsync<DiscussItemDto>(Queryable, filter.PageIndex, filter.PageSize);
}
```

### Additional entity

Code example:

```csharp
public override async Task<Discuss> AddAsync(Discuss entity)
{
    var res = await Command.CreateAsync(entity);
    // TODO: do something
    // 提交更新
    await Command.SaveChangeAsync();
    return res;
}
```

### Updating the entity

`Manager` provides a `GetCurrentAsync` method to get the current (`writable dbcontext`) entity.

In the controller, the entity will be obtained first. If it does not exist, it will directly return to`404`.

The entity update method passes two parameters, one for the entity itself and one for the submitted`DTO` object.
The entity itself is obtained by using`GetCurrentAsync` method in the controller, and can be passed directly as a parameter.

Code example:

The following aspects demonstrate how to update associated content.

```csharp
public override async Task<ResourceTypeDefinition> UpdateAsync(ResourceTypeDefinition entity, ResourceTypeDefinitionUpdateDto dto)
    {
        // 更新关联的内容
        entity!.AttributeDefines = null;
        if (dto.AttributeDefineIds != null)
        {
            // 通过父类的 Stores 查询其他实体的内容
            var attributeDefines = await Stores.ResourceAttributeDefineCommand.Db.Where(a => dto.AttributeDefineIds.Contains(a.Id)).ToListAsync();
            entity.AttributeDefines = attributeDefines;
        }
        return await base.UpdateAsync(entity, dto);
    }
```

### For more information

`Manager`provides default query method for details, which can directly pass query conditions.

If you customize queries, such as querying associated content, you need to add new methods to implement them.

`Manager`provides `Query.Db` members to query directly against the current model.

Code example:

```csharp
public async Task<ResourceGroup?> FindAsync(Guid id)
{
    return await Query.Db
        .Include(g => g.Environment)
        .FirstOrDefaultAsync(g => g.Id == id);
}
```

### Deletion processing

Delete defaults to soft delete, and if you want to modify this behavior, set`EnableSoftDelete` to false in your `Manager` class. like:

`Command.EnableSoftDelete = false;`

Deletion sometimes involves**association deletion**, example code:

```csharp
public override async Task<Resource?> DeleteAsync(Guid id)
{
    var resource = entity;
    if (resource!.Attributes != null)
    {
        Stores.CommandContext.RemoveRange(resource.Attributes);
    }
    return await DeleteAsync(resource);
}

```

## Call business logic in controller

After you implement the business interface and implementation in`Application`, you can call the related business methods in the interface class in`Http.API`through dependency injection.

> [!NOTE]
>Please keep the code of the controller clean and avoid`查询数据库、实现业务逻辑`directly in the controller.

## Perform the migration

After you add or modify entities, you need to perform a database migration for the database structure changes to take effect.

You can use`dotnet ef` command to generate migration scripts.

> [!IMPORTANT]
>Database migration is required under`Http.API`project.

Or you can simply execute the migration generation`script/EFMigrations.ps1`we provide.

> [!TIP]
>You don't need to execute`dotnet ef update` because the program commits changes automatically when it starts.
