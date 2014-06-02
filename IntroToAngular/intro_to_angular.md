# Intro To Angular

[](/angularjs.jpeg)

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

* Why `Angular`? How is it different?
  -  It attempts to minimize the impedance mismatch between document centric HTML and what an application needs by creating new HTML constructs.
  
  - Angular implements MVC by asking you to split your app into MVC components, then just let Angular do the rest. Angular manages your components for you and also serves as the pipeline that connects them.


###Getting Started
  * Visit [angularjs.org](Angular) and download Angular.
  
  ####What is a Directive?
  
  * In Angular, we add behavior to our HTML through directives. A directive is a marker on a HTML tag that tells Angular to run or reference some Javascript code.
  
  * The `ngApp` directive -  denotes the beginning of an application, and everything inside its tags will have access to binding. It attaches the Application Module to the page.

###Other Built-In Directives:
 
  * `ngBind` - this attribute tells Angular to replace the text content of the specified HTML element with the value of a given expression, and to update the text content when the value of that expression changes.
  
* Using the `{{}}` in angular templating can leave a bunch of `{{}}` curly braces on our screen, so we can also use `ng-bind`
  
  ```
  <div ng-app>
    1 + 2 = <span ng-bind="1+2"></span>
  </div>
    
  ```

* Use `ng-bind` to set variables
  
  ```
  <div ng-app>
    1 + 2 = <span ng-bind="answer =3"></span> <br>
    and we can use the answer somewhere else, divide {{answer}} by 2
    
  </div>
    ```
      
####Exercise:

      1. Set a `greeting` to a variable using `ng-bind` and display it.
    2. Try to set a `name` and `salutation` in the same `ng-bind` statement. Display them in the html. What is problematic about doing this?  *(Hint: use `;` to separate the declaractions)* 
    3. Set a few different variables in a single `ng-bind` what determines what gets displayed?
    4. How could we get around the problem of an `ng-bind` always displaying something?
    
###More Directives

  * `ngStyle` - directive allows you to set CSS style on an HTML element conditionally.
  
  ````
  <div ng-app>
    <span ng-bind="person={name:'john', lastname: 'doe'};nill;"></span>
    {{person.name}}
  </div>
  ````

  ````
  <div ng-app>
      <span ng-bind="myStyle={color:'red'};nill;"></span>
      The following text is <span ng-Style="myStyle">important</div>
  </div>
  ````
  
  * `ng-repeat` - directive instantiates a template once per item from a collection. Each template instance gets its own scope, where the given loop variable is set to the current collection item, and $index is set to the item index or key.
  
    ````        
  <div ng-app>
        <div  ng-init="friends=['larry', 'moe', 'curly']">
      <div  ng-repeat="friend in friends">
        {{friend}}
      </div>
      </div>
  </div>
  ````
  
  * `ngInit`- directive allows you to evaluate an expression in the current scope
  
  
###Exercise
 
- Make an array of friends that are objects where each has a `name` and `style` attribute,  
  e.g. `friends=[{name: 'moe', style: {color: blue}}]`, and repeat over them, displaying their style also.  
    
###Angular Forms

   * `ngModel` - directive binds an input,select, textarea (or custom form control) to a property on the scope using NgModelController, which is created and exposed by this directive.

  * ngModel is responsible for:
    1) Binding the view into the model, which other directives such as input, textarea or select require.
    2) Providing validation behavior (i.e. required, number, email, url).
    3) Setting related css classes on the element (ng-valid, ng-invalid, ng-dirty, ng-pristine) including animations.
     * TODO: Example
     
   * `ngList` - Text input that converts between a delimited string and an array of strings. The delimiter can be a fixed string (by default a comma) or a regular expression.
     * TODO Example
     * TODO Exercise
   * `ngForm`
     * Example
     * Exercise

###Some Cool Features
   * `ng-cloak` - directive is used to prevent the Angular html template from being briefly displayed by the browser in its raw (uncompiled) form while your application is loading.
   * `ng-pluralize` - directive that displays messages according to en-US localization rules
   * `ng-filter` - Selects a subset of items from array and returns it as a new array
   
If you're really into Angular by the end of this, follow [Google's Angular Blog](http://blog.angularjs.org/)!