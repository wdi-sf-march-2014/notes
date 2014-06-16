# Intro To Datastructures
## Prototypes


| Objectives |
| :----	|
| Define objects in JS using a constructor function |
| Add behavoir to an object using the object  prototype |
| Create an object with chainable, private, and public methods. |


## Outline

* Why Data Abstractions (Intro) (5mins)
	* Collections of data
	* Behavoirs 
* Objects in Javascript 
	* object literals
	* properties
	* iterating
* Functions 
	* as objects
	* returning objects
	* trying to efficiently create methods 
* Function Prototypes 
	* creating a constructor 
	* private variables 
	* private functions 
	* public variables
	* chaining 
	

## Intro

Before we begin with Javascript *prototypes* it is important to recognize how `data-abstractions` are relevant and connect to both the topic of **Data Structures** and **Web Development**.

### Why Data Abstractions

In Javascript we learned that functions are **first-class** citizens, and that we can solve most of our problems using them. However, without a good way to *represent common patterns* of using data and functions we have no ability to quickly express **structural repetition** or clearly **model the world around us**. We sacrifice brevity, clarity, time, and modularity.

* Question: What's a good way of comparing Functional Programming and Object Oriented Programming

### Objects In JS

The object literal in Javascript, `{}`,  is a familiar part of programming in Javascript, and probably still very similar to an `Array` at this point, except for the keys.

We are familiar with `Arrays` and `Objects`:

	var mrSpock = {
		name: "Mr.Spock",
		rank: "Commander",
		post: "Science Officer",
		alliance: "Starfleet"
	};	

(Questions about this style? [Google Style Guide](https://google-styleguide.googlecode.com/svn/trunk/javascriptguide.xml?showone=Code_formatting#Code_formatting))
			
	var friends = [
		"Jane",
		"John"
	];

Using the `new` keyword is a way of calling the Array or Object **constructor** to create a **new instance** like we did in ruby. Keep it in mind for the remainder of this lesson.

	var friends = new Array();
	
	friends[0] = "Jane";
	fiends[1] = "John";

Warm up: 

* Iterate over each `key` and `value` of `mrSpock` and replace each `value ` with its `lowercase` string.
* If we added an `age` of `55` to `mrSpock` what would happen if attempt the above iteration again. 

### Functions

How are functions different from objects in Javascript?

[unlearning](https://www.youtube.com/watch?v=z4jeREy7Pbc)

Let's re-examine how we use functions by making a function that makes star ships.

	var makeStarShip = function(){};

This is the same as saying:
	
	var makeStarShip = new Function();


Warm Up:

* Use [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function) to guide you on how to make a function (using the `Function` constructor) that multiplies two numbers.

If functions are objects then they can have properties and functions too.

	function makeStarShip(){};
	makeStarShip.alliance = "Star fleet";


### Functions Returning Objects

* Example: using closure and functions:

		function MakeStarShip(shipName){
			return {
				getShipName: function(){
					return shipName;
				}
			};
		};
	
	
	* Create a new ship.
	* Change new ship name.
	* Add ability to add members to ship.
	* Compare and Contrast a function that constructs objects with namespacing.

### Efficiently create objects (Motivating Prototypes)

* Example:
	
		function MakeStarShip(shipName){
			return {
				getShipName: function(){
					return shipName;
				}
			};
		};
		var voyager = makeStarShip("challenger");
		var enterprise = makeStarShip("enterprise");
	
	* Do objects `voyager` and `enterprise` have the same `getShipName` function? 

* Attempting to separate out functionality

	 	var starShipMethods  = {
			getShipName: function(){
				return shipName;
			}
		};
		
		function MakeStarShip(shipName){
			return starShipMethods;
		};
	* We get two functions having the same instance of a method.
	* We lose `closure` and we break everything. (Try running this and calling getShipName)

## Function Prototypes

### Using a Constructor

* Let's turn our `makeStarShip` function into a constructor.

		function StarShip(shipName){
			if(shipName){
				this.name = shipName;
			}
		};
	
		StarShip.prototype.shipName = "Top Secret";
	* Discuss `hasOwnProperty` vs prototype properties
	* Discuss iteration over objects
	* Discuss `constructor` and `constructor.name`
	* SideEffects with the prototype
	
			function StarShip(name, captain){
	    		this.name = name;
	    		this.captain = captain;
			};

			StarShip.prototype.pastCaptains = [];
			StarShip.prototype.changeCaptain = function(newCaptain){
		    	this.pastCaptains.push(this.captain);
		    	this.captain = newCaptain;
			};

Warm Up:

*  How would you implement a private method?
*  How would implement a `class` method?

### Chaining

It is often useful to be able to chain functions on an object when manipulating them. Imagine the following code for our `StarShip`.

	
		function StarShip(name){
    		this.name = name;
		};
		
		StarShip.prototype.evasiveManeuvers = function(){
			console.log("Aye, sir!");
		};
		
		StarShip.prototype.engage = function(){
			console.log("Jumping to maximum warp")
		};


		var enterprise = new StarShip("enterprise");
		enterprise.evasiveManeuvers();
		entertprise.engage();
		

Refactor the `StarShip` prototype so that we can call `enterprise.evasiveManeuvers().engage()`,

## Exercise

* Make a `RightTriangle` Prototype
	* Should have own properties `base`, `height`
	* should have prototype properties:
		* area
		* hypotenuese
* Make 	`RightTriangle`'s `base` and `height` private, and create methods to read these properties.

Rock Papper Scissors

* Make a prototype called `Player`
	* Should have own properties `name` and `response`.
	* Should have prototype properties:
		* `promptForResponse` that prompts the player for a response
		* `checkResponse` that returns the `response` and sets own property `response` to empty string;
* Make a prototype called `RPSGame`
	* should have own properties
		*  `player1` and `player2` that are objects
	* should have prototype property called `checkWinner` that checks if `player1.checkResponse()` is a win, draw, or loss against `player2.chekResponse()`, and re
	* should have prototype property called `play` that does the following:
		*  prompts to see if someone wants to play,
		*  calls `promptForResponse` for both `player1` and `player2`
		*  calls `checkWinner`
		*  alerts winner
		*  prompts to play again then repeats based on response.

## Reads
* [JS Garden](http://bonsaiden.github.io/JavaScript-Garden/)
* [execution-in-kingdom-of-nouns](http://steve-yegge.blogspot.com/2006/03/execution-in-kingdom-of-nouns.html)
* [Design Patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/)



