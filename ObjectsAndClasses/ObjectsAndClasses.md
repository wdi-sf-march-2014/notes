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
aStudent = {
   first_name:    'Damon',
   last_name:     'Albarn',
   major:         'Record Production',
   date_of_birth: '1968-03-23',
   enrollments: [
     { course: 'Beginning Mixing', grade: 4.0 },
     { course: 'Intro to Music', grade: 3.9 }
   ]
}
```	

* Our implementation is completely and publically exposed
* That can limit our ability to make changes later
* Where could we implement our calculated fields such as `gpa`?
* What happens if someone makes a typo on their hash keys
* What happens if someone uses an incorrect format for a value?

##Using Classes

Classes allow us to:

* Keep information and behaviour together in one place
* Encapsulate the details of our implementation 
* Keep the global namespace clear of naming conflicts
* Define a clear interface to our implementation
* Classes give us cleaner code (see next topic)

##Starting to Design a Class

One way to design your classes is to think about how you want to use them, so sometimes it's helpful to pretend that we have our class already and write `pseudocode` (or Tests for __Test Driven Development__ ) to clarify our ideas of the interface our class should have

```
student = Student.new('Damon',  'Albarn', 'Record Production', '1968-03-23')
	
student.addEnrollment('Beginning Mixing', 4.0)
student.addEnrollment('Intro to Music', 3.9)

emailTitle = "Hi #{student.first_name}! Welcome to your new Semester"
	
puts "#{student.fullName} has a GPA of #{student.gpa}"

puts "We have a total of #{Student.studentCount} students"

```

##Defining the Class which Meets our Expectations
Over the next few pages I'll demonstrate how to build the class, then you can try the workshop

We will introduce:

* Instance variables :       `@first_name`
* Instance methods  :        `def gpa  ....`
* initialize method :        `def initialize (first, last ....`
* attr_accessor method :     `attr_accessor :first_name, :last_name ....`
* Class variables :          `@@studentCount`
* Class methods :            `def self.studentCount ...`



#The Code Along
https://github.com/stujo/ruby-classes-workshop


#The LAB!
https://github.com/stujo/ruby-classes-lab


##Defining a New Class

Start with the easy stuff!

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

##Defining a New Class (2)

Start with the easy stuff!

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
	
##Class 	


##Module

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
	

##Further Reading

* [http://blog.rubybestpractices.com/posts/rklemme/018-Complete_Class.html
](http://blog.rubybestpractices.com/posts/rklemme/018-Complete_Class.html)

* [http://ruby.learncodethehardway.org/book/ex40.html](http://ruby.learncodethehardway.org/book/ex40.html)







