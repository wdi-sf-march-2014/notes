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
 
* [Sites that use `Angular'](https://builtwith.angularjs.org/)

- Let's take a step back:

  - HTML is a great declarative language for static documents. It does not contain much in the way of creating applications, and as a result building web applications is an exercise in what do I have to do to trick the browser into doing what I want?

* Why `Angular`?
  -  It attempts to minimize the impedance mismatch between document centric HTML and what an application needs by creating new HTML constructs.
  
  - Angular implements MVC by asking you to split your app into MVC components, then just let Angular do the rest. Angular manages your components for you and also serves as the pipeline that connects them.

* What is `Angular` and how is it different?


###Getting Started
  * Visit [angularjs.org](Angular) and download Angular.

* The `ngApp` directive 
  * In Angular, we add behavior to our HTML through directives. A directive is a marker on a HTML tag that tells Angular to run or reference some Javascript code.
  The ng-app attaches the Application Module to the page.

###Built-In Directives:
 
  * `ngBind` - this attribute tells Angular to replace the text content of the specified HTML element with the value of a given expression, and to update the text content when the value of that expression changes.
    * Example
    * Exercise

  * Angular Interpolation 
  * `ngStyle` - directive allows you to set CSS style on an HTML element conditionally.
  * `ng-repeat` - directive instantiates a template once per item from a collection. Each template instance gets its own scope, where the given loop variable is set to the current collection item, and $index is set to the item index or key.
    * `ngInit`- directive allows you to evaluate an expression in the current scope
    
###Angular Forms

   * `ngModel`
     * Example
   * `ngList`
     * Example
     * Exercise
   * `ngForm`
     * Example
     * Exercise

###Some Cool Features
   * `ng-cloak` - directive is used to prevent the Angular html template from being briefly displayed by the browser in its raw (uncompiled) form while your application is loading.
   * `ng-pluralize` - directive that displays messages according to en-US localization rules
   * `ng-filter` - Selects a subset of items from array and returns it as a new array