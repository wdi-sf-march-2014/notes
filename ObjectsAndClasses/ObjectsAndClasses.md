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

We're thinking about the `Students` at our `College`

Pair Up and come up with at least two answers to each of the following:

	* What information do we know about a student?
	* What actions can a student perform?
	* What questions can we ask any student?
	
##Hashes are Flexible
How can we represent this information, actions and questions in a Hash?

	aStudent = {
	   ...
	}


##Defining a New Class

	class Student
	  
	
	end

	
##Hashes

	students = [
	  {
	    first_name: 	'Barry',
	    last_name: 		'White',
	    major: 		'Musicology',
	    date_of_birth:  	"1994-11-12",
	    gpa: 		3.4,	    
	    courses:		['Piano Accompaniment ','Mathematics 101','Operatic Voice 403','Intro to Music']	
	  },
	  {
	    first_name: 	'Donna',
	    last_name: 		'Summer',
	    major: 		'Singing',
	    date_of_birth:  	"1948-12-31",
	    gpa: 		4.0,	    
	    courses:		['Your Voice as an Instrument','Disco for beginners','Intro to Music']	
	  },
	  {
	    first_name: 	'Skril',
	    last_name: 		'lex',
	    major: 		'Electronics',
	    date_of_birth:  	"1988-01-15",
	    gpa: 		3.9,	    
	    courses:		['Beginning Mixing','basic soldering','advanced arduino','Intro to Music']	
	  }
	]


##Further Reading

* [http://ruby.learncodethehardway.org/book/ex40.html](http://ruby.learncodethehardway.org/book/ex40.html)







