# 说明

Core是项目的核心部分，是被其他项目所引用的项目。项目中最基础常用的代码会写在该项目中。

## Utils

基础的工具帮助类，常用扩展方法等。

- `Extensions`，常用扩展方法
- `HashCrypto`，常用加解密方法
- `StringExtensiion`，字符串扩展方法

## Models

基础类型

- `EntityBase`，实体基础父类

## Entities

实体类型

## Const

常量定义

## 建议及约定

1. 使用`Guid`作为主键类型
2. 时间格式使用`DateTimeOffset`而不是`DateTime`，默认时间使用`DateTimeOffset.UtcNow`
3. `Entities`文件夹只存放业务相关的实体模型
