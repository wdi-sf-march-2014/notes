#Inheritance

##Objectives:
1. Describe what is inheritance is and identify the benefits & disadvantages of its use. Create a 2 classes in which one class inherits from another class.
1. Create a class that can override methods from it's parent class.
1. Illustrate the different ways you can load code: load, require, require_relative

##Quick Quiz Review:
1. What is a method? What is an instance method?
1. What is a class? What is class method?

##Goal #1 - Inheritance:

- Inheritance is used to indicate that one class will get most or all of its features from a parent class. 
    
*When is inheritance useful?
        a. DRY - Don't Repeat Yourself

REPLACE        b. Rails uses it heavily.

        c. Example: Suppose you're building an application  helps you ship goods. Many forms of shipping are available, but all forms share some basic functionality (weight calculation, perhaps). We don’t want to duplicate the code that implements this functionality across the implementation of each shipping type. 

##Demo
```
class Animal
  def speak
    puts "I am an animal"
  end
end
```

```
class Person < Animal
    def initialize(age, gender, name)
        @age = age
        @gender = gender
        @name = name
    end
end
```

- Single Inheritance
    - In Ruby, a class can only inherit from a single other class. It *cannot* inherit from multiple classes.
    ![](https://draftin.com:443/images/13819?token=LgAN2Cjq0VY2E1kC14KkUjazImyXfmOTtc-EiNJbdofQ25kQLkSBtxVpde5pu1y2if0_H6LTEUeTaklH1Yjmimw) 
    - Benefits and disadvantages to single & multiple inheritance
    - In Ruby, initialize is an ordinary method and inherited just like another method.

##Code-Along
```
class Box

  def initialize(w, h)
    @width = w 
    @height = h
  end

  def get_area
    @width * @height
  end

end

class BigBox < Box

  def print_area
    @area = @width * @height
  end

end

#create an object
box = BigBox.new(10, 20)

#print the area
puts box.print_area()
```

##Exercise #1:
Create a Mammal class, Cat class, and Dog class. Have Cat and Dog inherit from Mammal. Include some attributes for each class and a method for mammal.

##Goal 2 - Overriding & Super:

Demo

```
class Dog  
  def initialize(breed)  
    @breed = breed  
  end  
  
  def to_s  
    "(#@breed, #@name)"  
  end  
end  
  
class Lab < Dog  
  def initialize(breed, name)  
    super(breed)  
    #super 
        #calls the method of the parent class
        #& passes all the arguments into the parent class
    @name = name  
  end  
end  
  
puts Lab.new("Labrador", "Ben").to_s 
# .to_s is called implicitly with any puts or print or p method call  
```

- When you invoke *super* with arguments, Ruby sends a message to the parent of the current object, asking it to invoke a method of the same name as the method invoking super. super sends exactly those arguments.

##Exercise #2:
Create a Bird class & a Penguin class. Give the Bird class an initialize, preen, and fly methods. Give the Penguin class a new fly method (since it cannot fly).


##Goal #3 - load, require, require_relative
    - When your projects start to grow & you start using multiple files, you'll need Ruby's require and load methods.

```
class Calendar
  def initialize(month, year)
    @month = month
    @year  = year
  end

  # A simple wrapper around the *nix cal command.
  def to_s
    IO.popen(["cal", @month.to_s, @year.to_s]) { |io| io.read }
  end
end

puts Calendar.new(8, 2011)
```

##load
- This will reload the ruby file every time it's called.
- Load is typically used for checking for small changes and debugging - does not keep track of whether a file or library has been loaded

1. In Pry, try this:
    ``` pry(main)> load 'calendar.rb'```
1. Now add to the initialize: 
    ```@day = day```


##require
- This will load a ruby file ONCE and only once. All subsequent require statements will not reload the file.
- Doesn't need the .rb file extension, but won't hurt if it's there.


##require_relative



##Exercise
