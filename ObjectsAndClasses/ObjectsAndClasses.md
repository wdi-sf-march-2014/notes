Objects and Classes
=================

![Stone Henge - http://tujophoto.com/](http://clients.stujophoto.com/photos/i-J3TMMz7/4/L/i-J3TMMz7-L.jpg)

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
* Understand Why We Use Classes
* Have an Approach for designing a new class


##Objects and Classes Demo
You've already been experiencing the joys of classes

__Try This:__

	hello = 'Hello World!'
	p hello.class

	customer = { name: 'Mary', phone: '555-123-4444' }
	p customer.class

	attendees = [ 'Alan', 'Catherine' ]
	p attendees.class
	p attendees[0].class
	
	nothing = nil
	p nothing.class

**Classes are a way to group functionality and data into objects and you as a human are already exceptionally good at using objects!**

__Example:__
If you know how to drive a car, when you get into any car, you can drive it, regardless of which model / manufacturer the car comes from. That's because you have an internal idea of the `Class` called `Car` and you understand the `Interface` that `Instances` of the class `Car` present to their users
  	
================

##Today you are a Record Company Executive!

And We're thinking about the `Bands` at our `Record Label`

![image](http://upload.wikimedia.org/wikipedia/commons/6/6f/Intermediapost_Recording_Studio.jpg)

================

##Review: Hashes are Flexible but have Limitations
How can we represent this information, actions and questions in a Hash?

```
aBand = {
   name:   		   'Gorillaz',
   agent:         'Billy Connelly',
   date_signed:   '2000-03-23',
   releases: [
     { title: 'Gorillaz', year: 2001, sales: 1000001 },
     { title: 'Demon Days', year: 2005, sales: 930430 },
     { title: 'Plastic Beach', year: 2010, sales: 783211 },
     { title: 'The Fall', year: 2011, sales: 8761232 }
   ]
}

```	

* Our implementation is completely and publically exposed
* That can limit our ability to make changes later
* Where could we implement our calculated fields such as `total_sales`?
* What happens if someone makes a typo on their hash keys
* What happens if someone uses an incorrect format for a value?

================


##Using Classes



```
class Band

 #... Your code goes here

end


```
__Try This Now__

* [Step 001](https://github.com/stujo/ruby-classes-demo/blob/step001/lib/band.rb)

1. Create a project folder `ruby-classes-demo`
2. Create a lib directory
3. Create a new file lib/band.rb
4. Create our class Band ... end
	

================

##Describing a Potential Class

We're thinking about the `Bands` at our `Record Label`

Pair Up and come up with at least two answers to each of the following:

	* What information do we know about a band?
	* What actions can a band perform?
	* What actions do we want to perform on a band?


================

##Starting to Design a Class

One way to design your classes is to think about how you want to use them, so sometimes it's helpful to pretend that we have our class already and write `pseudocode` (or Tests for __Test Driven Development__ ) to clarify our ideas of the interface our class should have

```
band = Band.new('Gorillaz', 'Billy Connelly', '2000-03-23')
	
band.add_release('Gorillaz', 2001, 1000001 )
band.add_release('Demon Days', 2005, 930430 )
band.add_release('Plastic Beach', 2010, 783211 )
band.add_release('The Fall', 2011, 8761232 )

emailTitle = "Hi Fan! #{band} has a new release called #{band.latestRelease.name}"
	
puts "#{band.name} has cumulative sales of of #{band.total_sales} units"

puts "#{band.name} is managed by #{band.agent} and signed with us on #{band.date_signed}"

puts "Currently we have #{Band.bandCount} bands signed to our label"

```

================

##Adding Some Instance Methods

	
* [Step 002](https://github.com/stujo/ruby-classes-demo/blob/step002/lib/band.rb)
    
	a. Add our constructor the initialize method
	b. Store the parameters in instance variables
	c. Make our instance variables available with attr_accessor


================

##Class without attr_accessor

```
 # filename: 'student.rb'
	
class Student
	def initialize (first,last,major,date_of_birth)
	   @first_name = first
	   @last_name = last
	   @major = major
	   @date_of_birth = date_of_birth
	end

	def first_name
	  @first_name
	end

	def first_name=(first)
	  @first_name= first 
	end
			
	def last_name
	  @last_name
	end

	def last_name=(last)
	  @last_name= last 
	end

	def major
	  @major
	end

	def major=(maj)
	  @major= maj 
	end

	def date_of_birth
	  @date_of_birth
	end

	def date_of_birth=(dob)
	  @date_of_birth= dob 
	end
end
```
That was very unexciting!

================

##Class with attr_accessor

```
 # filename: 'student.rb'
	
class Student
	attr_accessor :first_name, :last_name, :major, :date_of_birth
	
	def initialize (first,last,major,date_of_birth)
	   @first_name = first
	   @last_name = last
	   @major = major
	   @date_of_birth = date_of_birth
	end
end
```

That's Better!


=================
##Adding More Instance Methods

* [Step 003](https://github.com/stujo/ruby-classes-demo/blob/step003/lib/band.rb)
    Here we'll introduce instance methods that do something!
    a. Add our instance method `add_release`
    b. Add our instance method `total_sales`	  
    c. Add our instance method `latest_release`
    d. Realize that another class `BandRelease` makes sense here

=================
##Adding Class Variables and Methods


* [Step 004](https://github.com/stujo/ruby-classes-demo/blob/step004/lib/band.rb)
	Here we'll introduce a class variable and a class method!
    a. Add our class variable `@@band_count`   
    b. Add our class method   `band_count` 	


================
#Time to Do It (in Pairs)!
================

1. Go look at this repository:

	[https://github.com/stujo/ruby-classes-workshop](https://github.com/stujo/ruby-classes-workshop)
	
2. Read the README.md in the project	

3. FORK IT into your GitHub account

4. In your terminal, go to where you are keeping your ruby projects then CLONE your FORKED repo to your computer

5.	git clone https://github.com/YOURUSERNAME/ruby-classes-workshop

5. Which Should create a `ruby-classes-workshop` folder

6.	cd ruby-classes-workshop

6. Get started! `ruby students_as_hashes.rb` will show you the existing app

7. Re-Read README.md if you're not sure what to do


================

##Why We Use Classes	

Classes allow us to:

* Keep information and behaviour together in one place
* Encapsulate the details of our implementation 
* Keep the global namespace clear of naming conflicts
* Define a clear interface to our implementation
* Classes give us cleaner code

================


##One more thing: Modules

Sometimes we don't want to instantiate instances but we do want to group together a number of related methods. For example `Math` which exposes a number of mathematical functions for your use and amusement

```
module OrderProcessor

   def self.processOrder(customer, items)
      #do something to process the order
   end

end
```

[http://www.dotnetperls.com/math-ruby](http://www.dotnetperls.com/math-ruby)

================


##What We Covered

* Where to put your classes: In YOUR_CLASS_NAME`.rb`
* class              :       `class`
* initialize method :        `def initialize (name, agent ....`

* Instance variables :       `@agent`
* attr_accessor method :     `attr_accessor :name, :agent ....`

* Instance methods  :        `def add_release, total_sales  ....`

* Class variables :          `@@band_count`
* Class methods :            `def self.band_count ...`

* Modules : 				  `module OrderProcessor`

================

#The Self Study Lab Instructions
================

The Lab is an RSpec Driven Lab, but you are not learning RSpec, just running it

This means that I've written tests already and you need to write the code to make the tests pass

__DO THIS NOW__

* Go to https://github.com/stujo/ruby-classes-lab
* FORK the Repo to your GitHub
* CLONE YOUR forked Repo onto your computer
* __cd ruby-classes-lab directory__
* READ the README.md in that folder __Let's read the README.md Together__

Because this lab uses RSpec we need to make sure it is installed

	gem install rspec

__Once you've completed the lab__

* Commit your changes
* Push the changes to your GitHub Repo
* Create a Pull Request to ruby-classes-workshop master


=============	

##Further Reading

* [Inheritance and Overrides - http://ruby.learncodethehardway.org/book/ex44.html](http://ruby.learncodethehardway.org/book/ex44.html)

* [Includes vs Extends - http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/](http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/)

* [Class Example - http://blog.rubybestpractices.com/posts/rklemme/018-Complete_Class.html
](http://blog.rubybestpractices.com/posts/rklemme/018-Complete_Class.html)

=============	

##Struct

Sometimes your see `Struct` this works similarly to a `Hash` but with fixed attributes

You can add method definitions too, reproducing what you can do with `class`, without the `class`. I haven't used them though.


http://www.ruby-doc.org/core-2.1.1/Struct.html

```
Customer = Struct.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end

dave = Customer.new("Dave", "123 Main")
dave.name     #=> "Dave"
dave.greeting #=> "Hello Dave!"
```

