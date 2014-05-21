Exposing Functionality in Javascript
==============

#Intro
We can only test what we can see. Most organized javascript projects don't put too much
into the global namespace, instead the functions are anonymous and enclosed in closures

In order to test functions or call them from the page or other scripts we need to be able
to access them

#Closures and Scope
A closure occurs when a function is defined inside a scope and access variables from
the parent scope.

You've already created functions like this for event handlers in jQuery:

[http://jsbin.com/kefop/1/edit?html,js,console,output](http://jsbin.com/kefop/1/edit?html,js,output)

    $(document).ready(function() {

        var myname = 'Mary';

        $('#mybutton').click(function(){
            alert('Hello ' + myname);
        });
    });


#Document Ready
If all your code is wrapped in a document ready block, none of the functions will be
available to be called outside of that closure.

That's fine (and indeed great!) for event handlers which are attached within the closure
but sometimes we want to expose functionality to other scripts or to the page itself

This can be done in several ways:

##window scope

For a single function:

[http://jsbin.com/gokep/1/edit?html,js,output](http://jsbin.com/gokep/1/edit?html,js,output)

    $(document).ready(function() {

        var my_hidden_var = 'My Secret';

        window.myname = window.myname || {};

        myname.something = function() {
            return 'Something about ' + my_hidden_var;
        };

    });


For a closure:

[http://jsbin.com/suzak/1/edit?html,js,console,output](http://jsbin.com/suzak/1/edit?html,js,console,output)

    $(document).ready(function() {

        var my_hidden_var = 'My Secret';

        window.myname = window.myname || {};

        myname.something_else = {
          foo: function()
          {
            return 'foo: ' + my_hidden_var;
          },
          bar: function()
          {
            return 'bar: ' + my_hidden_var;
          }
        };
    });

These methods make the functions available to the rest of the application and to test frameworks

#Other Solutions
##AMD and RequireJs and Loading Modules on Demand

* AMD - Asynchronous Module Definition (AMD) API
    * [https://github.com/amdjs/amdjs-api/blob/master/AMD.md](https://github.com/amdjs/amdjs-api/blob/master/AMD.md)
* Require JS - module loader
    * [http://requirejs.org/](http://requirejs.org/)
* gem 'requirejs-rails'
    * [https://github.com/jwhitley/requirejs-rails](https://github.com/jwhitley/requirejs-rails)
    * ```config/requirejs.yml```

