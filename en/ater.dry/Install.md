# Install

## Require

- Installing the [`.NET SDK`](https://dotnet.microsoft.com/zh-cn/download)

## Version

First check the package version, the tool depends on the. NET SDK, and the corresponding relationship is as follows:

|Package Version|.NET SDK Version| support|
|-|-|-|
|8.x| 8.0+| current version|

## Install tool

Use `dotnet tool` command to install:

```pwsh
dotnet tool install --global ater.dry
```

You can check the latest version in [nuget](https://www.nuget.org/packages/ater.dry)!

## Use

### use the Web UI

One command to start the UI!

```pwsh
dry studio
```

> [!NOTE]
>If a new version is installed, run `dry studio update` before starting Studio.

### use the command line

You can use `dry --help` check command help information.

Or use `dry[command] --help` see specific command help information.

> [!TIP]
>Using command-line tools, you can generate relevant code independently of the project structure! Because you can specify specific entity paths and code output paths.

## Next step

Congratulations on successfully installing and running the tool.

You can now [create](创建并运行项目.md) new solution projects using this tool.
