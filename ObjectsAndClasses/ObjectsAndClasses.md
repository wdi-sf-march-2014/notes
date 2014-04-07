#DRAFT! DO NOT USE

#Objects and Classes

##Intro

* ** Everything in Ruby is an Object **
* ** Every Object is an Instance of a Class **
* ** Classes are Objects Too **

##Lesson Objectives
In Ruby, you will be able to:

* Find an Object's class
* Define a new Class
* Create instances of your Class
* Use `attr_reader`, `attr_accessor`

##Objects and Classes Demo

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

We're thinking about the `Customers` at our `DonutShoppe`

Pair Up and come up with at least two answers to each of the following:

	* What information do we know about a customer?
	* What actions can a customer perform?
	* What questions can we ask any customer?
	
##Hashes are Flexible
How can we represent these information, actions and questions in a Hash?

	aCustomer = {
	   ...
	}


##Defining a New Class

	class Customer
	
	end

	
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







