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
  	

##Describing a Potential Class

We're thinking about the `Bands` at our `Record Label`

Pair Up and come up with at least two answers to each of the following:

	* What information do we know about a band?
	* What actions can a band perform?
	* What questions can we ask any band?
	
##Hashes are Flexible but have Limitations
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

#Using Classes

Classes allow us to:

* Keep information and behaviour together in one place
* Encapsulate the details of our implementation 
* Keep the global namespace clear of naming conflicts
* Define a clear interface to our implementation
* Classes give us cleaner code (see next topic)

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

##Defining the Class which Meets our Expectations
Over the next few pages I'll demonstrate how to build the class, then you we'll try the workshop

We will introduce:

* Where to put your classes: In YOUR_CLASS_NAME`.rb`
* class              :       `class`
* initialize method :        `def initialize (name, agent ....`
* Instance variables :       `@agent`
* Instance methods  :        `def add_release, total_sales  ....`
* attr_accessor method :     `attr_accessor :name, :agent ....`
* Class variables :          `@@band_count`
* Class methods :            `def self.band_count ...`
* Loading classes :          `require and require_relative`


#Simple Ruby Class

1. [Step 001](https://github.com/stujo/ruby-classes-demo/blob/step001/lib/band.rb)
	a. Create a project folder `ruby-classes-demo`
	b. Create a lib directory
	c. Create a new file lib/band.rb
	d. Create our class Band ... end
	
2. [Step 002](https://github.com/stujo/ruby-classes-demo/blob/step002/lib/band.rb)
	a. Add our constructor the initialize method
	b. Store the parameters in instance variables
	c. Make our instance variables available with attr_accessor

3. [Step 003](https://github.com/stujo/ruby-classes-demo/blob/step003/lib/band.rb)
    a. Add our instance method `add_release`
    b. Add our instance method `total_sales`	  
    c. Add our instance method `latest_release`
    d. Realize that another class `BandRelease` makes sense here

4. [Step 004](https://github.com/stujo/ruby-classes-demo/blob/step004/lib/band.rb)
    a. Add our class variable `@@band_count`   
    b. Add our class method   `band_count` 	

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
Better!
	
##Module

Sometimes we don't want to instantiate instances but we do want to group together a number of related methods. For example `Math` which exposes a number of mathematical functions to


http://www.ruby-doc.org/core-2.1.1/Module.html

```
module Mod
  include Math
  CONST = 1
  def meth
    #  ...
  end
end
Mod.class              #=> Module
Mod.constants          #=> [:CONST, :PI, :E]
Mod.instance_methods   #=> [:meth]
```

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

#Time to Code Along (in Pairs)!

Let's try some pair programming!

1. Go look at this repository:

	[https://github.com/stujo/ruby-classes-workshop](https://github.com/stujo/ruby-classes-workshop)
	
1. Read the README.md in the project	

1. FORK IT into your GitHub account

1. In your terminal, go to where you are keeping your ruby projects then CLONE your FORKED repo to your computer

1. ```
git clone https://github.com/YOURUSERNAME/ruby-classes-workshop
```

1. Which Should create a `ruby-classes-workshop` folder

1. ```
cd ruby-classes-workshop
```
1. Get started! `ruby students_as_hashes.rb` will show you the existing app

2. Re-Read README.md if you're not sure what to do





#The Self Study Lab Instructions
The Lab is an RSpec Driven Lab

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


	

##Further Reading

* [Inheritance and Overrides - http://ruby.learncodethehardway.org/book/ex44.html](http://ruby.learncodethehardway.org/book/ex44.html)

* [Includes vs Extends - http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/](http://www.railstips.org/blog/archives/2009/05/15/include-vs-extend-in-ruby/)

* [Class Example - http://blog.rubybestpractices.com/posts/rklemme/018-Complete_Class.html
](http://blog.rubybestpractices.com/posts/rklemme/018-Complete_Class.html)



