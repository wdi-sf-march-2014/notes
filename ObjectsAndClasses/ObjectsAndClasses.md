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
          date_of_birth: "1994-11-12",
          grades: [3.4, 3.6, 3.2, 3.4],
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
          grades: [4.0, 3.9, 3.8, 3.8],
          courses: [
              'Beginning Mixing', 'basic soldering',
              'advanced arduino', 'Intro to Music'
          ]
      }
  ]
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


p calculateGPA allStudents[0]
p calculateGPA allStudents[1]
p calculateGPA allStudents[2]
```



##Using Classes

Classes allow us to keep information and behaviour together in one place. We can encapulate the details of our implementation and keep the global namespace clear of naming conflicts


##Defining a New Class

	# filename: 'student.rb'
	
	class Student
	  
	
	end
	
##Class 	
	

##Further Reading

* [http://ruby.learncodethehardway.org/book/ex40.html](http://ruby.learncodethehardway.org/book/ex40.html)







