# Intro To Angular
## Data-Binding, Templates, and All That



| Objectives  | 
| :----     |
| Student should use data binding in views: `ng-model`, `ng-bind` |
| Students should be comfortable with commonly used directives: `ng-repeat` with `ng-model` or `ng-bind`. |
| Students should use directives together to create templates   |   

## Outline

* What is Angular?* 
  - AngularJS is a client-side Javascript framework for adding interactivity to HTML. It lets you use HTML as your template language and lets you extend HTML's syntax to express your application's components clearly and succinctly.

  Let's take a step back:
    HTML is a great declarative language for static documents. It does not contain much in the way of creating applications, and as a result building web applications is an exercise in what do I have to do to trick the browser into doing what I want?

* Why `Angular`?
Angular's approach:
  -  It attempts to minimize the impedance mismatch between document centric HTML and what an application needs by creating new HTML constructs.
  
1) Angular implements MVC by asking you to split your app into MVC components, then just let Angular do the rest. Angular manages your components for you and also serves as the pipeline that connects them.
2) 

* What is `Angular` and how is it different?


* Getting Started
  * Visit [angularjs.org](Angular) and download Angular.

* Sites that use `Angular`


* The `ngApp` directive 
  * In Angular, we add behavior to our HTML through directives. A directive is a marker on a HTML tag that tells Angular to run or reference some Javascript code.
  The ng-app attaches the Application Module to the page.
  
  * `ngBind` 
    * Example
    * Exercise
  * Angular Interpolation 
  * `ngStyle`
  * `ng-repeat`
    - repeat a section for each item in an Array
    * `ngInit`
    
  * Angular Forms
    * `ngModel`
      * Example
    * `ngList`
      * Example
      * Exercise
    * `ngForm`
      * Example
      * Exercise
  * Cool Features
    * `ng-cloak`
    * `ng-pluralize`
    * `ng-filter`