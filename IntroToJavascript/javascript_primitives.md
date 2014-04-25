# JavaScript Introduction

## Objectives
* History of Javascript
* 
* Understand Data Types
  * Comments
  * Numbers
  * Values & Expressions
  * Conditionals
  * Reference Types
  * Undefined
  * False
* Understand Javascript Object Literal
* Understand Javascript Control Flow
  * Conditionals (if/else)
  * While loop
  * For loop
  * Switch case

## Why Javascript? 
Simple answer: We want high performance web sites!

But what does this mean?

* Client side programming:</h3>
  * Interaction with the DOM
  * Respond to DOM events: click, submit...
  * Send requests to the server.
  * Act on response from the server.


## Comments in Javascript:
* Ruby uses '#' to indicate a comment line.
* JavaScript uses '//' for line comment.

## Numbers:
* Ruby has Integers and Floats
* JavaScript we have just Numbers.

## Values & Expressions
* Computers return values when you give them expressions. 
* Give the computer a value and it returns a value, thus values are expressions as well.
  
    // values are expressions
    console.log(42);
    //=> 42

    // addition is an expression
    console.log(2 + 2);
    //=> 4

    // string concatenation is an expression
    console.log("hello" + " world");
    //=> "hello world"

## Conditionals: always use Triple Equal "===" or "!=="
* Check to see if two values are identical with the "===" strict equality.

    console.log("Always use triple equal sign to test equality.")

    console.log(42 === 42);
    //=> true

    console.log(3 === "3");
    //=> false

    // Double equal operator gives the wrong result!!
    console.log(3 == "3");
    //=> true

    console.log(2 + 2 === 4);
    //=> true

    console.log("foo" !== "bar");
    //=> true
    
## Reference Types: 
### Even if they have the same values and are the same type, reference types are not strictly equal.
* Arrays are unique structures.

    console.log("Arrays are reference-type data structures.")
    console.log([1,2,3] === [ 2-1, 1+1, 2+1]);
    //=> false

    console.log([1,2,3] === [1,2,3]);
    //=> false


## Undefined
* When something is "undefined" it has no value.
* Oddly enough "undefined" is a value.

    
    console.log("undefined is a value-type.");
    console.log(undefined === undefined);
    //=> true

## False
* 0, false, null, undefined, Empty String: ""
    
    console.log("False Tester:");
    // Try: 0, "", undefined, null, false. Anything else is true!
    if(0) { 
      console.log(true);
    } else {
      console.log(false);
    }

## JavaScript Object Literals

  var micky_mouse = {
                    "first_name": "Micky",
                    "last_name": "Mouse",
                    "address": "Disneyland"
                  }
  var micky = {
                    "first_name": "Micky",
                    "last_name": "Mouse",
                    "address": "Disneyland"
                  }

  // ##### JS Object Literals are reference types
  // Access a literal value with ".key" syntax!
  console.log(micky_mouse.first_name);
  // This also works
  console.log(micky_mouse["first_name"]);

  console.log("Are JS Object Literals values? ")
  if(micky_mouse === micky ) {
    console.log(true );
  } else {
    console.log(false );
  }


## Conditional (if-else)
  console.log("if - else if - else:")
  // var state = "red";
  var state = "green";
  // var state = "blue";

  // "message" is an example of a JavaScript Object Literal.
  var message = {
                "failing": "Tests are failing.",
                "passing": "Tests are passing.",
                "refactor": "Time to refactor."
              }
  if (state === "red") {  
  
    console.log(message.failing);
    
  } else if (state === "green") {
  
    console.log(message.passing);
    
  } else { // Time to refactor.
  
    console.log(message.refactor);
    
  }

## While loop
  var a = [1,2,3,4];
  var b = [1,2,3,4];

  console.log("While Loop:")
  
  var i = 0;
  
  while(i < a.length){
  
    console.log("The element at index " + i + " is: " + a[i]);
    i++;
    
  }

## For loop

  var mixed = [1, "two", "three", true];
  
  console.log("For Loop:")
  
  // Most common mistake is using commas instead of "semicolons" inside the loop declaration.
  
  for(var i = 0; i < mixed.length; i++) {
  
    console.log("The element at index " + i + " is: " + mixed[i]);
    
  }
## Switch Case
  var expression = "label2"

  switch (expression) {
    case "label1":
        console.log("First case: label1");
        break;
    case "label2":
        console.log("Second case: label2");
        break;
    case "labelN":
        console.log("Nth case: labelN");
        break;
    default:
        console.log("Default case.");
        break;
    }


## Exercise: Implement a routine that checks to see if two arrays are identical.
* Set "result" to "true" if the two arrays are equal, and to "false" if the two arrays are unequal.
*  
* Turn array compare exercise into a function that returns true or false.



## Resources:
* [Code School free course on the Developer Tools](https://www.codeschool.com/courses/discover-devtools)
* [JavaScript Alonge](https://leanpub.com/javascript-allonge/read#leanpub-auto-a-pull-of-the-lever-prefaces)
* [MDN JavaScript Reference](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)
