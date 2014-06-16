# Prototypical Inheritance
## Tips and CoffeeScript


| Objectives |
| :---- |
| Apply constructors and prototypes together to implement inheritance between objects in Javascript |
| To examine lookup in the prototype chain and articulate certain advantages via diagrams |
| To  translate these notions into CoffeeScript | 


## Related Topics

* Class Inhertiance (as seen in Ruby, helpful)
* Javascript Prototypes
* Special Functions:
	* Apply
	* Call


## Overall Goal

* Reduce code complexity
* Encourage code reuse
* Model the world around us 

## Classical Inheritance


### Ruby Flashbacks

In Ruby we saw that we could have a method for quickly transfering behavior and attributes using inheritance.

Examples:

1.) In Rails we typically have the following examples.
	
* With some controllers like the following

		class BooksController < ApplicationController
			def index
			end
		end
	
	and 
	
		class ApplicationController < ActionController::Base
		end
	
	`ActionController::Base` provides the basic methods needed for rendering, redirecting, manipulating sessions, etc. Then Application sits between everything to act as a middleground for quickly adding functionality across your entire application.
	
2.) In Ruby land we saw the following example many times over

	class Person 
		def initialze(name)
			@name = name
		end
		
		def name
			@name
		end
	end
		
	class Student < Person
		def initialize(name, course)
			super(name)
			@course = course
		end
	end


### A Prototype In JS

In javascript we don't have classes. We have prototypes

	function Person(name){
		this.name = name
	};
	
	Person.prototype.greet = function(){
		return "Hello, my name is " + this.name;
	};

* Why do we use the prototype?
* What is a `hasOwnProperty`?
* What is a `prototypeProperty`?
* How do we create a new `Person`?

### Inheriting Via Prototypes -- Classical Pattern

Given the following prototype let's create a student.

	function Person(name){
		this.name = name
	};
	
	Person.prototype.greet = function(){
		return "Hello, my name is " + this.name;
	};

	function Student(name, course){
		this.name = name;
		this.course = course;
	};

	Student.prototype = new Person
	Student.prototype.constructor = Student;

* What's inherited?
* Why set the constructor?


Exercises:

* Create the following prototypes
* Create a method called `inherit` that takes two constructors and achieves the above inheritance.
* | Polygon |
  | :---- |
  | Edges: greater than equal to three, required |
  | Vertices: greater than equal to three, required |
  | EdgeList: An array with all the edge lengths inside (limited by number of allowed Edges) |
  | AddEdge: Allows user to add another  edge to `EdgeList`|  
  | Perimeter: returns sum of EdgeList if EdgeList has length equal to Edges |
	*  Include the above plus
	the following
	
	   | Quadrilateral |
	   | :---- |
	   | Edges: 4 |
	   | Vertices: 4 |	   	   	   
	*  Similarly
	
	   | Rectangle |
	   | :---- |
	   | Area |
	   | Perimeter |
   

### Pitfals--Side Effects

When we inherit in JS we have to watch out for in the wild.

	
	function Person(name){
		this.name = name;
		this.friends = [];
	};
	
	Person.prototype.addFriend = function(name){
		this.friends.push(new Person(name));
	};
	
	function Student(name){
		this.name = name;
	};
	
	Student.prototype = new Person()
	Student.prototype.constructor = Student;

* Create two students and add different  friends to each. What 
	* What happens after adding a friend?
	
### Calling on a solution

Remember that using `call` or `apply` allows you to set the `this` context for a function before it is run.

	function Person(name){
		this.name = name;
		this.friends = [];
	};
	
	Person.prototype.addFriend = function(name){
		this.friends.push(new Person(name));
	};
	
	function Student(name){
		// masks all the constructor properties
		Person.call(this);
		this.name = name;
	};
	
	Student.prototype = new Person()
	Student.prototype.constructor = Student;


* Do we really want hasOwnProperties?

### Sharing a prototype

	function Person(name){
		this.name = name;
	};
	
	Person.prototype.greet = function(){	
		return "Hello! My name is " + this.name;
	}
	
	function Student(name){
		// masks all the constructor properties
		Person.call(this);
		this.name = name;
	};
	
	Student.prototype = Person.prototype;
	
* What are the pitfalls with this?

### Copying the Prototype

	function Person(name){
		this.name = name;
	};
	
	Person.prototype.greet = function(){	
		return "Hello! My name is " + this.name;
	}
	
	function Student(name){
		// masks all the constructor properties
		Person.call(this);
		this.name = name;
	};
	
	var Intermediary = function(){};
	// Copy just the prototype
	Intermediary.prototype = Person.prototype;
	Student.prototype = new Intermediary;

* Turn this inheritance process into a function called `inherits`.
* Create a new `Student`. What's the constructor name of the new student?

This is an interesting idea of copying one objects prototype and returning an instance of a copy. 

* How could we in general take an object and do this process with it?

		function createObject(protoObj){
			function Intermediary(){}
			Intermediary.prototype = obj;
			return new Intermediary();
		}


## Prototypal Inheritance






