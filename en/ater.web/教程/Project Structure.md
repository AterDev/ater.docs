# Project Structure

## root directory

- docs: project document storage directory
- scripts: directory of project script files
- src: Project Code Directory
- test: test item directory
- runtime:`.NET Aspire` based development environment integration
- .config: Configuration file directory
- The. dry-config.json project configuration information is required when using`dry cli`.

## Code directory src

- The basic definition of an Infrastructure framework is usually not a concern and should not be modified.
- Definition layer, first defined and then implemented. This directory mainly defines entities and DTOs, as well as ORM relationships.
  - Entity core library,**`Entity`** definition project, including base library extensions, auxiliary classes, etc.
  - Share Shared class libraries,**`DTO`** defines the project, which can be shared among multiple applications, such as various model definitions, common configurations, data processing transformations, etc., depending on`Entity`.
  - Entity Framework`Entity Framework` defines projects that depend on`Entity`.
- Application**`Manager`** is a business implementation project, including various services. Dependency`Share`,`EntityFramework`.
- Http.API**`WebAPI`** interface project, define and implement controller logic, open to the outside world and run the main program, dependent on`Application`.
  - ClienApp integrated front-end project, using`Angular` framework, can replace itself.
- Microservice breaks down separately deployable applications, such as microservice projects, often relying on`Application` projects to reuse related logic code.
- Modules module directory. Rather than splitting into separate services, modules are primarily used to achieve separation of concerns, which remains part of the main service. Modules typically include:
  - DTO models required by the Models interface
  - Manager Business implementation logic for this module
  - Controller interfaces defined or exposed by the module

> [!NOTE]
>There is no module-based development here, nor is there a concept of it. The module here is based on the division of services, splitting the corresponding service implementation on the code to achieve separation of concerns.
>
>Modules have their own business implementation logic and API interface definitions. It refers to`Application` project to achieve business logic reuse, and is referenced by`Http.API`main project to uniformly expose interface access.
>
>The entity model of the module is still defined and managed in the Entity project
>

## practical guidance

`Entity`only used to store solid model classes, and all solid models should be placed in the project.

`Http.API`handles content related to Web interface interaction, including interface definition, validation and processing of requests and responses, permission authentication, etc. All data is operational or business logic and should not be placed in this project.

`Application`projects are primarily used to implement business logic, including third-party interfaces or services that are integrated or invoked.
