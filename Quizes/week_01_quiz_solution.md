# Week 1 Quiz 1

## Ruby Arrays

1. Create an array of the days of the week
 - Create a variable named days_of_the_week as an array of the following: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
 
```
arr = %w{ Monday Tuesday Wednesday Thursday Friday Saturday Sunday }
```

2. My calendar says the first day is Sunday...
 - Remove Sunday from the last postion and move it to the first position. Use array methods.

```
arr.unshift arr.pop
```

## Ruby Hashes

Given the following data structure:

```ruby 
users = {
  "Jonathan" => {
    :twitter => "tronathan",
    :favorite_numbers => [12, 42, 75],
  },
  "Erik" => {
    :twitter => "sferik",
    :favorite_numbers => [8, 12, 24],
  },
  "Tripta" => {
    :twitter => "triptagupta",
    :favorite_numbers => [12, 14, 85],
  },
}
```

- Write code that would add the number 7 to Erik's favorite numbers.
```
# This question depends on how you interpret that sentance.

users["Erik"][:favorite_numbers].map! { |num| num + 7 }

## OR

users["Erik"][:favorite_numbers].push 7
````
- Write code that would add yourself to the users hash.
```
users["Tim"] = { :twitter => "I don't have twitter", :favorite_numbers => [1] }
```
- Write code that returns the array of Erik's favorite numbers.
```
users["Erik"][:favorite_numbers]
```
- Write code that returns the smallest of Erik's favorite numbers.
```
users["Erik"][:favorite_numbers].min
```

## Ruby Methods 
    
* Describe the output of the folowing
        
        def greet()
            greeting = "Hello!" + welcome()
        end
        
        def welcome()
            welcoming  = "Welcome to the event." + direct_to_seat()
        end
        
        def direct_to_seat()
            "Please take a seat"
        end
        
        puts greet()
        

```
Hello!Welcome to the event.Please take a seat
```

* Describe the output of the following
    
        def my_func()
            puts "going down 1!"
            my_second_func()
            puts "going up 1!"
        end
        
        def my_second_func()
            puts "going down 2!"
            my_third_func()
            puts "going up 2!"
        end
        
        def my_third_func()
            puts "going down 3"
            puts "going up 3"
        end 
 
        my_func()

```
going down 1
going down 2
going down 3
going up 3
going up 2
going up 1

##OR This would return an error.  Either solution is fine. 
```

* Define a method that prompts a user with a `question` and checks it against an array of `answers` until the answer is valid.

```
valid = false

answers = ['h', 'q']

until valid
  puts "What do you want to do?"
  puts "h - print hello"
  puts "q - quit"
  resp = gets.chomp
  if answers.include? resp
    valid = true
  else
    valid = false
  end
end

# Do code based on response

```


* Write a `swap` method that takes an array and two indexes to swap

```
def swap(arr, ind1, ind2)
   temp = arr[ind1]
   arr[ind1] = arr[ind2]
   arr[ind2] = temp
   nil
end
```
 
## Ruby Classes

* Given the class definitions below
    

```
class Animal
     attr_reader :age, :weight
     attr_accessor :name
     
     def initialize(name, age, weight)
         @name = name
         @age = age
         @weight = weight
     end
     
     def name
         @name
     end
     
     def name=(other)
         @name = other
     end

     def speak
          "Animal noise"
     end
end

class Lion < Animal
     attr_reader :is_king_of_pride_lands
     def initialize(name, age, weight, is_king_of_pride_lands)
         super(name, age, weight)
         @is_king_of_pride_lands = is_king_of_pride_lands
     end
     
     def speak
         if is_king_of_pride_lands
             "ROOOOAAAAAAARRRRRR!!"
         else
             "roar!"
         end
     end
end
```
     
* What instance variables are accessible in the Lion class?

```
is_king_of_pride_lands, name, age, weight
```
* Create a new object that is a Lion who is the king of the pride lands and is named Simba.

```
l = Lion.new("Simba", 10, 200, true)
```

* Use the new Lion that you created.  What is the return result of calling the speak method

```
"ROOOOAAAAAAARRRRRR!!"
```

* Create a new Animal object.  Call speak.  What is the returned result of speak.

```
a = Animal.new("Simba", 10, 200)
a.speak # returns "Animal noise"
```
