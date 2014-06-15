
# Javascript++

### Objectives

* Justify Javascript Namespacing
* Establish Javascript Scoping
* Apply Scoping to this keyword

## Namespacing

   * A first person 

```
        var Person = (function(){
           var api = {
                sayHello: function(name){
                    return "Hello, " + name;
                }
            };
            return api;
        })();
        
        console.log(Person.sayHello());
```

* Better Person

```
        var Person = (function(){
           var api = {
                firstName: "Jane",
                sayHello: function(name){
                    return "Hello, " + name;
                },
                introduce: function(){
                    return "My name is, " + Person.name;
                }
            };
            return api;
        })();
        
        console.log(Person.introduce());
```

* A more private person

```
        var Person = (function(){
           var getAge = function(){
                return 25;
           };
           var api = {
                firstName: "Jane",
                sayHello: function(name){
                    return "Hello, " + name;
                },
                introduce: function(){
                    return "My name is, " + Person.name;
                },
                ofDrinkingAge: function(){
                    return getAge() >= 21;
                }
            };
            return api;
        })();
        
        console.log(Person.ofDrinkingAge());
```
    



### Exercise

Look up the docs for `_.each`.   What does each do? You can play around with `_.each` in the console of the underscore website.  Implement each using a javascript namespace.  The namespace for the method should be Iterator.  Do not worry about context at this point.  We will cover it later.  BONUS: Get the each method working for both arrays and javascript objects.

## Javascript Scoping and Apply

Apply calls a function in terms of an object.  Here is an example:

```
var myDailyTasks = {
    sayHello: function(){
        return "Hey, Howdie, Hi!";
    },
    eatBreakfast:function(mealTime){
        if(mealTime === "breakfast"){
            return "Eat " + this.favoriteCereal;
        } else if( mealTime === "brunch"){
            return "Eat " + this.favoriteBrunch;
        } else {
            return "This isn't the time!";
        }
    }
}
var joe = {
   name: "Joe",
   favoriteCereal: "Frosted Flakes"
}
var dan = {
    name: "Dan",
    favoriteCereal: "Cocoa Puffs"
}

myDailyTasks.eatBreakfast.apply(dan,["breakfast"]);
```

What does `this` do in __this__ case?

### Exercise

Change the dan and joe object so that `apply` can be called on either object and "brunch" can be passed as the argument.

## Applications of Scoping: this keyword

```
var myDailyTasks = {
    sayHello: function(){
        return "Hey, Howdie, Hi!";
    },
    eatBreakfast:function(mealTime){
        if(mealTime === "breakfast"){
            return "Eat " + this.favoriteCereal;
        } else if( mealTime === "brunch"){
            return "Eat " + this.favoriteBrunch;
        } else {
            return "This isn't the time!";
        }
    }
}
var joe = {
   name: "Joe",
   favoriteCereal: "Frosted Flakes"
}
var dan = {
    name: "Dan",
    favoriteCereal: "Cocoa Puffs"
}

dan.eatBreakfast = myDailyTasks.eatBreakfast

//  What does dan.eatBreakfast() do?
```

### Exercise

Look at the docs for `_.each`.  What does the context do?  Test it out and get used to what it's doing.  Implement `_.each` with a context.  If you get that working, implement `_.map`, with a context. Look at [http://underscorejs.org/#each](http://underscorejs.org/#each) for some examples of context.
