# Angular Rails
## Intro to Angular Modules


| Objectives |
| :---  |
| Using multiple controllers in an application to separate different aspects of the application. (Think how rails doesn't shove everything in the `ApplicationController` class.)|
| Managing dependencies needed to successfully separate components into modular and versatile chunks.  |
| Students should be able to handle scoping with nested controllers.  |


## Outline

###Multiple Controllers
  * Separate Controllers
  * Nesting Controllers
    * inheriting
    * overiding inherited attributes

###What is a module?
You can think of a module as a container for the different parts of your app – controllers, services, filters, directives, etc.

###Why do we need modules?
- Most applications have a main method that instantiates and wires together the different parts of the application.

- Angular apps don't have a main method. Instead modules declaratively specify how an application should be bootstrapped. There are several advantages to this approach:

  1) The declarative process is easier to understand.
  2) You can package code as reusable modules.
  3) The modules can be loaded in any order (or even in parallel) because modules delay execution.
  4) Unit tests only have to load relevant modules, which keeps them fast.
  5) End-to-end tests can use modules to override configuration.

####When Should I Use A Module?
- There should be a module for each feature aka feature separation
- There should be a module for each reusable component (especially directives and filters)
- When an application level module which depends on the above modules and contains any initialization code

* More Modular Angular
  * `angular.module` - The angular.module is a global place for creating, registering and retrieving Angular modules. All modules (angular core or 3rd party) that should be available to an application must be registered using this mechanism.
    * An `App` module

####Dependency Injection
Dependency injection is a software design pattern which is often used in infrastructure components and which ensures that one particular component does not directly create references to other components. Instead of direct instantiation, every component will receive references to required other components like helpers, services, etc. as parameters to their constructor.
    
* TODO: Modular Controllers
  * A module for controllers

##Angular Services
- Angular services are substitutable objects that are wired together using dependency injection (DI). You can use services to organize and share code across your app.

Angular Services are:

  - Lazily instantiated -- only instantiates when an application component depends on it
  - Singletons - each component dependent on a service gets a reference to a single instance

###How Do You Use Angular Services?
  - Need to add it as a dependency as a component (controller, service, filter, or directive) that depends on the service.