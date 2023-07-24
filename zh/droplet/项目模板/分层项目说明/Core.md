# Core

Core是项目的核心部分，承载着实体模型的定义，其他的一切也是围绕着实体模型进行开发，项目中最基础常用的代码会写在该项目中。

## Const

常量定义

## Entities

实体定义目录，是应用最为核心和基础的部分，所有的业务都是围绕着实体进行的，实体定义了应用的数据结构，是应用的基础。

## Models

项目本身需要的基础类型定义

## Utils

基础的工具帮助类，常用扩展方法等。

- `Extensions`，常用扩展方法
- `HashCrypto`，常用加解密方法
- `StringExtension`，字符串扩展方法

## 建议及约定

1. 建议使用`Guid`作为主键类型
2. 时间格式使用`DateTimeOffset`而不是`DateTime`，默认时间使用`DateTimeOffset.UtcNow`
3. `Entities`文件夹只存放业务相关的实体模型
