# What is Ater.Web?

`Ater.Web.template`is an out-of-the-box solution template based on`ASP.NET Core`,`Entity Framework`, and `.NET Aspire`, combined with a large number of project practices to help new and old developers quickly develop application services.

## characteristics

- Based on official technology, it is not `Another Framework`, and it is extremely versatile.
- Templates include all source code, no `nuget package`, transparency and focus.
- For the purpose of development and maintenance efficiency, it provides layered project structure and code practice specifications, which are suitable for various scenarios such as single application, microservice, multi-person collaboration, etc.
- Provide intelligent code assistant tools to minimize repetitive work.

>**Summary: simple, universal, practical!**

## What can it do for you?

- Quickly build a working project and provide common configuration and dependency injection.
- It provides a practical way to better organize your code, while achieving separation of concerns and improving development and maintenance efficiency.
- Learning and building general knowledge systems rather than learning and using specific usage.
- DRY(don't repeat yourself), which uses intelligent code assistants to generate code for you to save time.
- Help team members get started on projects quickly, even if they are new to them, and quickly implement the business.

## The following may not apply

- Templates do not provide functionality integrations that are available without development, such as payments, CMS, authentication, etc. You need to select other options and integrate them.
- Much of our code implementation and generation is based on`Entity Framework`, and if you don't use it, you won't enjoy the convenience.
- Does not apply to interface development using `minimalAPI` style.
- The new template is based on`.NET 8.0`, and older versions do not apply.

> [!NOTE]
>Using this set of templates and development tools, your development work will be simple and orderly, with a business implementation you only need to:
>
>- Define solid model
>- Template code generation via tools (e.g. DTO, basic CURD, interfaces).
>- Adjust and implement your own business logic according to the actual business.
>- Define exposed interfaces

## Install

premise

- Install [`.NET SDK 8.0`](https://dotnet.microsoft.com/zh-cn/download)

Install using `dotnet new` command.

```pwsh
dotnet new install ater.web.templates
```

## Use

After installation, you can create a project using the command or by selecting Create via VS's graphical interface (recommended).

```pwsh
dotnet new atapi -n my-project
```

Go to `Http.API` project and configure the database connection string in `appsetings.json`

> [!TIP]
>`PostgreSQL`is used by default. Please change it according to your actual needs.

## Install ater.dry (recommended)

`ater.dry`is an intelligent code assistance tool, mainly provides code generation function, it can analyze your entity, intelligently help you generate related data transfer objects, database read and write operations and API interfaces. It is provided by `dotnet` command-line tools, while providing Web UI interface, can save a lot of development time, strongly recommended installation use!

```pwsh
dotnet tool install --global ater.dry
```

> [!TIP]
>This tool provides out-of-the-box support for `Ater.Web` templates!

## next step

🎉Congratulations on the successful completion of the project creation, to understand the [project structure](./%E6%95%99%E7%A8%8B/%E9%A1%B9%E7%9B%AE%E7%BB%93%E6%9E%84%E8%AF%B4%E6%98%8E.md)!
