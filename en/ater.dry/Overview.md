# Ater.Dry

**Dry**comes from the principle of `don't repeat yourself`!

**Dry**is an intelligent code assistance tool, mainly provides code generation function, it can analyze your entity, intelligent help you generate related data transfer objects, database read and write operations and API interfaces.
To reduce repetitive template coding efforts.

It is available as `dotnet` command-line tool and supports a `Web UI`.

## Feature

- Intelligent analytics based on entity models to understand user business intent
- Intelligent generation of DTO files, including add, update, query, list and other common DTO
- Intelligent generation of data operations and business logic implementation, including common new, update, filter functions
- Generate partial test code
- Generate Controller Interface
- Generate interface types for Typescript from Swagger OpenApi
- Generate request services for Angular or Axios based on Swagger OpenApi
- Angular Basic CURD page
- Other More Advanced Features

### Support for ASP.NET Core

The dry command tool helps developers generate common code templates from solid models (.cs files), including:

- Dto file, add, update, query, list, etc. Dto files
- Manager file, Business logic layer
- Controller files
- Protobuf files
- Client Request Services

### Support for Typescript

For the front end, the code (.ts) required for the request can be generated according to the json content of swagger OpenApi, including:

- Request service,`xxx.service.ts`
- interface model,`xxx.ts`

## As an intelligent assistant

**Dry**is not a simple code generator, it analyzes and understands your entity model classes, more intelligently understands your business logic and implementation intent, and generates relevant basic code based on this, you do not need to start from 0. All you need to do is focus on modeling the business itself.

## Project template support

The tool integrates with the [ater.web.templates](https://www.nuget.org/packages/ater.web.templates) project template so you can create solutions directly using a graphical interface!
