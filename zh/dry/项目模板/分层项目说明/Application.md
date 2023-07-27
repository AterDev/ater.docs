# Application

Application是业务实现的核心层，大多数业务逻辑实现都在该层进行定义和实现。

模板通过`QueryStore`和`CommandStore`对读写操作进行区分和隔离，然后通过`Manager`进行封装，这样在调用时，不需要关心数据的读写分离。

模板通过`QueryStore`和`CommandStore`对`DbContext`和`DbSet`进行了封装，但这不是为了实现`仓储模式`，而是结合实际使用场景，提供常用的方法封装，同时实现自定义功能。

> [!NOTE]
> 设计模式如`仓储模式、CQRS模式、观察者模式、中介模式`等是为了更好的组织代码，以及为实现业务功能服务的。本模板并不会特意去采用或实现某种模式，而是基于`方便、灵活、规范`的原则去组织代码。

## Const

应用常量定义目录

## AppServiceCollectionExtensions.cs

应用组件依赖注入扩展类，包含数据库、缓存、监测等组件的扩展方法。

## ManagerServiceCollectionExtensions.cs

业务逻辑实现服务的注入扩展类，由ater.dry.cli工具自动生成。

## Implement

数据仓储的基础实现类，请勿直接修改。

## Interface

数据仓储的接口定义，请勿直接修改。

提供两个扩展接口实现自定义

`interface ICommandStoreExt<TEntity>`

`interface IQueryStoreExt<TEntity>`

> [!IMPORTANT]
> 为了保持兼容性，请不要直接修改以上默认生成的内容，如果你需要自定义，可通过`partial class`、`扩展接口`以及`继承类`的方式实现。

## IManager

业务逻辑接口目录，可通过生成器生成，可自由修改。

## Manager

业务逻辑实现目录，可通过生成器生成，可自由修改。

## Services

用来编写自定义服务或引入第三方服务，通常通过依赖注入的方式使用。

---

## 实践

对于典型的`User`的CURD的接口实现场景：

### 定义实体模型和DTO

设计和编写实体模型和DTO模型

### 业务层实现

- 创建或修改`IUserManager`接口，定义功能接口。
- 创建或修改`UserManager.cs`,继承`DomainManagerBase<User>`,实现`IUserManager`定义的业务逻辑。
- 父类已实现常见的**CURD**操作。

### 控制器API

在控制器中编写接口，通过调用`Manager`实现具体逻辑。

## 建议

1. 接口层主要是对外提供`REST HTTP`，请尽可能的遵循`REST API`相关的规范和约定。
2. 通常会为每个实体对象（领域模型）编写对应的`Manager`，相关的操作和方法是面向该实体（领域）。
3. 在编写业务逻辑时，请先定义对应的`IXXXManager`接口方法，通过接口约束实体的方法。在依赖注入时，也会通过接口类型去注入。
