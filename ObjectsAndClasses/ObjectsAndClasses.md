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
	
Where could we implement our calculated fields such as `gpa`?

	
##Hashes

```
def allStudents
  [
      {
          first_name: 'Barry',
          last_name: 'White',
          major: 'Musicology',
          date_of_birth: "1944-11-12",
          grades: [3.4, 3.6, 4.0, 4.0],
          courses: [
              'Piano Accompaniment ', 'Mathematics 101',
              'Operatic Voice 403', 'Intro to Music'
          ]
      },
      {
          first_name: 'Donna',
          last_name: 'Summer',
          major: 'Singing',
          date_of_birth: "1948-12-31",
          grades: [4.0, 4.0, 4.0],
          courses: [
              'Your Voice as an Instrument', 'Disco for beginners',
              'Intro to Music'
          ]
      },
      {
          first_name: 'Skrillex',
          last_name: '',
          major: 'Electronics',
          date_of_birth: "1988-01-15",
          grades: [4.0, 3.9, 3.8, 3.9],
          courses: [
              'Beginning Mixing', 'basic soldering',
              'advanced arduino', 'Intro to Music'
          ]
      }
  ]
end

def fullName student
  "#{student[:first_name]} #{student[:last_name]}"
end

def calculateGPA student
  if student[:grades] && !student[:grades].empty?
    student[:grades].inject(0.0){
        |sum,grade| sum + grade
    } / student[:grades].length.to_f
  else
    0.to_f
  end
end

def printStudentSummary
  puts "#{fullName allStudents[0]} : #{calculateGPA allStudents[0]}"
  puts "#{fullName allStudents[1]} : #{calculateGPA allStudents[1]}"
  puts "#{fullName allStudents[2]} : #{calculateGPA allStudents[2]}"
end
```


##Using Classes

Classes allow us to keep information and behaviour together in one place. We can encapulate the details of our implementation and keep the global namespace clear of naming conflicts

##Start as the User of the Class
One way to design your classes is to think about how you want to use them, so let's rewrite our student application a bit assuming we've already written our `Student` class

```
def allStudents

  barry = Student.new 'Barry', 'White', 'Musicology', "1944-11-12"
  donna = Student.new 'Donna', 'Summer', 'Singing', "1948-12-31"
  skrillex = Student.new 'Skrillex', nil, 'Electronics', "1988-01-15"

  [barry, donna, skrillex]
end

allStudents.each { |student| puts "#{student.fullName} : #{student.calculateGPA}" }
```


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







