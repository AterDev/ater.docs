# 说明
数据库上下文,使用CQRS模式

# 目录

## DataStore
### 只读上下文
`class DataStoreQueryBase<TContext, TEntity>`

仅查询，不可进行`SaveChange`操作(会抛出异常提示)，所有查询都不使用`EF Core`的跟踪机制。


### 可写上下文
`class DataStoreCommandBase<TContext, TEntity>`


### 仓储上下文
`class DataStoreContext`

仓储上下文提供统一的仓储服务，对于一个实体对象，会有相应的`只读数据库上下文`和`命令数据库上下文`。
如，对于实体`User`对应,会有对应的属性:
- `UserQuery`
- `UserCommand`

同时，该类会开放数据库上下文，以便直接调用十一日方法。

> 在实现实际业务时，通常不会直接引用该类，而是通过实体管理类，如`IXXXManager`对实体对象进行操作。


## Interface

### 命令 (Command)

`interface IDataStoreCommand<TEntity>`

`interface IDataStoreCommandExt<TEntity>`

### 查询 (Query)
`interface IDataStoreQuery<TEntity>`

`interface IDataStoreQueryExt<TEntity>`

### 数据管理 (Manager)
`interface IDomainManager<>`

# 实践
对于典型的`User`的CURD的接口实现场景：

## 控制器接口实现
默认控制器会实现基础的`增加`,`修改`,`详情`,`分页查询`接口。


## 业务层实现
- 创建`IUserManager`接口，定义功能接口。
- 创建`UserManager.cs`,继承`DomainManagerBase<User>`,实现`IUserManager`定义的业务逻辑。
- 父类已实现常见的**CURD**操作。

### 重写业务逻辑
`DomainManagerBase`提供了以下成员，以便进行数据库相关的操作
- Query，对应实体的QueryDataStore,提供相关的查询方法，无法进行数据库写入。



## 数据仓储

## 自定义方法

> 以上内容皆可使用工具生成基础代码

## 建议和约定
1. 接口层主要是对外提供`REST HTTP`，请尽可能的遵循`REST API`相关的规范和约定。
3. 通常会为每个实体对象（领域模型）编写对应的`Manager`，相关的操作和方法是面向该实体（领域）。
4. 在编写业务逻辑时，请先定义对应的`IXXXManager`接口，通过接口约束实体的方法。在依赖注入时，也会通过接口类型去注入。