## Description of the method
The controller interface file corresponding to the entity is generated, and the data storage file and DTO file required by the corresponding controller will also be generated.
> The generation of the data warehouse relies on the 'EntityFramework Core', which requires the creation of a database context file first.

## command
`droplet webapi <entity path> [options]`
> Aliases: 'droplet api'

## parameter
- **'entity path'**, corresponds to the full path of the entity .cs file, supports absolute and relative paths, such as '.\Models\User.cs'.
- '--dto' or '-d', the directory where the generated Dto file is stored, the default path is '[./share]'.
- '--datastore' or '-s', the directory where the generated repository file is stored, the default path is '[./Http.Application]'.
- '--output' or '-o', the directory where the generated controller file is stored, the default path is '[./Http.API]'.
- '--contextName' or '-c', the database context class name, defaulting to 'ContextBase'

## behavior
1. This command will generate the corresponding controller, data warehouse, and DTO file, so you need to specify the corresponding directories separately, if you are not hierarchical, you can specify the same directory, the corresponding code subdirectory relationship:
    - API controller = > 'Controllers'
    - Data warehousing = > 'DataStroe'
    - dto file = > 'models'
2. The build depends on 'EntityFramework Core', you need to define the database context, and if you have multiple database context files, you need to specify the 'class name' instead of the file name. The command automatically searches the database context for the specified class name in the project.
3. This command will also generate the relevant interface files and extension methods to facilitate dependency injection in your 'ASP.NET Core' project.
