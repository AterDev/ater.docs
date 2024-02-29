# Organization code

Templates already provide a hierarchy to help us organize the code, and for monolithic applications, organize the code according to the project structure description.

But when we have a lot of developers and a lot of services, maybe we get confused. Here to share with you the corresponding solution, the specific use of which solution is determined by the user himself.

## Monolithic application

Templates provide structure and`Modules` that help developers organize code very easily, and have some extensibility and anti-interference for collaborative development (according to module division).
Finally, they all provide interface services through`Http.API`, which is very easy to understand and implement.

## Multi-service

To be clear, multi-services here refers to the fact that when a production environment is released, there will be multiple independent and different application services running.

For multiple services, or splitting into microservices, we can have different implementation scenarios, depending on your team!

> [!IMPORTANT]
>For the choice of solutions should consider the overall development experience of the team, which is mainly reflected in the development efficiency, implementation difficulty, risk and other aspects, do not sacrifice their own and team energy and time in order to achieve what others call "design patterns".

### Multiservice sharing business code

This programme is very easy to implement and understand, and its main features are as follows:

- I need to deploy multiple services at deployment time so that each service can be highly available.
- My services share business logic code, and different services just open different interfaces (Http/Grpc).

This scenario makes things simple, assuming we end up deploying three services

- User Interface Service:`Http.API`
- Administrator Interface Service:`AdminService`
- Customer Order Service:`OrderService`

This means that we will have three`WebAPI` projects and we will create`AdminService` and`OrderService` projects in`Microservice`.

We will develop in two ways:

#### 1 Shared Business Code

- All entities are defined in`Entity`, and all business logic is implemented in`Application`.
- All services reference`Application` project, but define only those interfaces that need to be open to the outside world.

This means that projects share all business logic, which is not split and decoupled according to service.

#### 2 Use modules to split business code

- All entities are defined in`Entity`
- Create`UserMod`,`AdminMod` and`OrderMod` modules respectively to implement the business logic (i.e.`Manager`) of each module.
- `Http.API`project references`UserMod`,`AdminService` references`AdminMod`,`OrderService` references`OrderMod`.

This allows decoupling of business logic, where services reference only their own business implementations.

Since each module still needs to reference`Application` project, this means that if there is a common business, it can still be reused, and of course this also means that each service is still not completely independent and decoupled.

We can see that through module segmentation, we can flexibly split business logic and deployment, and at the same time, we can reuse some code to a certain extent. This is sufficient for most cases.

If you must implement more independent and decoupled services, read on!

## Microservices (individual items for each service)

Before we go into specifics, we need to consider a few practical questions:

- Are there multiple teams implementing microservices
- Is it implemented in multiple languages
- Whether services use a uniform communication protocol, such as Grpc/Http, or inter-service communication through message queues.

This involves collaboration between teams and services, which can be very complex. In order to simplify the problem, we give some qualifications to facilitate a better discussion.

>If our team uses a unified language and framework to implement microservices

We'll talk about that earlier. And then we still have some questions:

- Does one solution correspond to one service?
- Does one solution include all services
- Does each service have its own independent repository

We still need to assume some scenarios for these questions in order to better discuss them.

>- Manage all service codes in one repository (master repository) or as a sub-repository of the master repository if the service has its own repository.
>- Manage all projects with one solution.

Working with solutions is a very natural thing for. NET developers, which means you can work on multiple projects in one IDE instance.

Next, suppose we need to follow`DDD` 's microservices practice and keep services separate, how should we implement it?

Let's make a few points clear:

- Each service contains only its own entity (domain) model
- Each service contains only its own implementation of business logic
- Each service only provides interfaces to domain services
- Each service has its own configuration and dependencies
- Each service has its own build and deployment requirements

In short, services are almost completely independent. For those that cannot reuse business logic codes, functional codes can be reused through class libraries.

### 1. Creating multiple solutions

One option is to create a template project for each service and develop it entirely independently.

So how should we coordinate? We can create a separate solution, add service items to that solution, and then use`.NET Aspire` for debugging.

### 2. Use only one solution

`Ater.Dry`can also be used to add new standalone services to existing solutions, or you can create your own`Http` or`GRPC` services.

These independent services have their own entity definitions, database contexts, business implementation layers, and interface layers. These hierarchies no longer exist as `project`, but as `folder`.
This is easy to understand because all code works only within the current service and does not need to be packaged into projects to be referenced by other projects.

`Ater.Dry`will automatically discover microservice items under the solution, and code generation can also identify entities in microservices and generate code in corresponding services.

> [!NOTE]
>Code generation only supports standalone services created using`Dry Studio`because it contains the default file directory hierarchy.
>
>If you use`.NET Aspire` for microservice development debugging, manually add the new service to`AppHost`after you create it.

## Recommendations

Depending on the situation, if your team or business requirements do not require you to split services independently, we recommend that you split business logic in modules.

If you must implement independent services, we recommend that you manage the entire project using a solution that encompasses all services.
