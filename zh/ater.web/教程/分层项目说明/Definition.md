# Definition

该目录包含三个项目，都是用来定义业务对象的，包括实体定义、DTO定义和ORM的定义。

## Entity

用来定义实体模型类的项目，并且所有实体模型都应该放到该项目中。

---

## EntityFramework

该项目是对EntityFramework的基础配置和封装，分别定义了`Command`和`Query` DbContext，以及Factory模式的定义。

通常你只需要在`ContextBase`中定义相应的实体`DbSet`属性。

如果使用`dry studio`代码生成，你甚至不需要手动修改该项目下的代码。

---

## Share

`Share`项目是在`Entity`之上的共享项目，它引用`Entity`项目。

该项目主要是提供`Dto`类型文件，以及封装和处理一些基础模块功能。

### Models

提供相关模型和`Dto`

### Options

提供选项模型

### 建议及约定

1. 该项目中封装的服务或功能，可单独进行测试，不与业务关联
2. 不进行数据库相关操作
3. 不进行业务逻辑处理
