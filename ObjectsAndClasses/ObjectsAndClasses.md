#Objects and Classes

##Intro

* ** Everything in Ruby is an Object **
* ** Every Object is an Instance of a Class **

##Lesson Objectives
In Ruby, you will be able to:

* Find an Object's class
* Define a new Class
* Create instances of your Class
* Use inheritance
* Override a inherited method
* Use `attr_reader`, `attr_accessor`

##Classes Demo

	hello = 'Hello World!'
	p hello.class

	customer = { name: 'Mary', phone: '555-123-4444' }
	p customer.class

	attendees = [ 'Alan', 'Catherine' ]
	p attendees.class
	p attendees[0].class
	
	nothing = nil
  	p nothing.class

##Describing a Potential Class

We're thikning about `Rectangles`

Pair Up and come up with at least two answers to each of the following:

	* What attributes does every rectangle have?
	* What questions can we ask any rectangle?
	* What operations can we perform on any rectangle?
	
##Using Hashes
	myRectangle = {
	   ...
	}
	

##Defining a New Class

	class Rectangle
	
	end



##Inheritance

* Triangle
	* What attributes does every triangle have?
	* What questions can we ask any triangle?
	* What operations can we perform on any triangle?
	
##Hashes

	myVehicles = [
	  {
	    color: 		'yellow',
	    brand: 		'Chevy',
	    model: 		'Impala',
	    year:  		1962
	    type: 		'station_wagon',	    
	    nickname: 	'Bananamobile',
	    license_class: 'C'
	  },
	  {
	    color: 'red',
	    brand: 'Honda'
	    type: 'motorcycle',
	    nickname: 'Red Rocket',
	    license_class: 'M'
	  },
	  {
	    color: 'orange',
	    brand: 'xooter'
	    type: 'kickscooter',
	    license_class: nil
	  },
	]


## What is a Vehicle?
* What attributes does it have?
* What kinds of things can you do with it?
* What relationships does it have?



##Further Reading

* [http://ruby.learncodethehardway.org/book/ex40.html](http://ruby.learncodethehardway.org/book/ex40.html)







