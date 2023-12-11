# DTO生成说明

使用工具可以解析实体，并生成相应的DTO，以下说明具体生成的规则。

## 生成内容

一个实体通常会生成以下几个模型类:

- `ItemDto`: 用于列表元素的模型
- `ShortDto`: 用于获取模型主要信息的模型
- `FilterDto`: 用于请求的筛选模型
- `AddDto`: 用于实体添加时的模型
- `UpdateDto`：用于更新的模型

## 生成说明

如果实体属性含有[JsonIgnore]属性，那么生成的DTO都会忽略该属性。

### ItemDto

列表元素不会包括以下属性：

- IsDeleted与UpdatedTime字段，但会包含CreatedTime
- 数组或列表
- 长度大于1000的字符串
- 导航属性及对应Id

### ShortDto

在ItemDto的基础上，忽略 CreatedTime以及"Content"字段。

### FilterDto

FilterDto生成内容如下：

- 忽略 "Id", "CreatedTime", "UpdatedTime", "IsDeleted"等基础属性
- 忽略列表及导航属性
- 忽略最大长度在于1000的字符串属性
- 保留必需属性(但不为导航属性)
- 包括枚举属性

### AddDto

添加模型生成内容如下：

- 忽略 "Id", "CreatedTime", "UpdatedTime", "IsDeleted"等基础属性
- 必须是可赋值的属性，即有`set`方法。
- 对于导航属性，会进行以下处理：
  - 忽略非必需的导航属性
  - 忽略列表导航属性
  - 对于必需的导航属性，会生成`属性名`+`Id`的形式来表示

### UpdateDto

更新模型生成内容同添加模型，但是更新模型所有属性默认都为可空属性。

可空属性，意味着，如果该字段为空，更新时，会忽略该字段，以此来实现部分更新。

> [!TIP]
> 如果你习惯进行全量更新，可直接复用`AddDto`模型。
