# Quiz
## Week 2
 
## RSPEC 

Given the Triangle class:
	
	class Triangle
	
	  attr_accessor :base, :height
	
	  def initialize(base,height)
	    @base = base
	    @height = height
	  end
	
	  def area
	    0.5 * @base * @height
	  end
	
	end

Write one "describe block" with two "it-blocks"" within. "Before each" test create a triangle with `@base = 4` and `@height = 8`. In the first "it-block" test that the `@base` equals `4` (attribute test). In the second "it-block," test that the `#area` equals `16` (method test).


## Algorithms 
* How can you tell if a method you are looking at is recursive or not?


__Given the following code__

```
def foo (x)
  puts x
  foo(x - 1) unless x == 0
end

foo 9
```

* What will the screen output of this code be?
* What is the return value of ```foo 9```




## Iterators
* What would be the output of the following  

	    def my_func
	        yield "Hello"
	    end
    
    	person = "john"
    	my_func {|greeting| puts "#{greeting}, #{person}" }
    	

* Why does the block have access to the person variable

* Implement each given the following definition:

```
class ArrayContainer
  def initialize(arr)
    @arr = arr
  end
	  
  def each &block
    # implement your code here in terms of @arr
  end
end
```


## HTTP request and response

* Define Server

* Name one thing that goes in a HTTP request header

* Name one thing that could come in an HTTP response body

* Name one status code that could come in an HTTP response header

## Intro Sinatra

   * My view is not rendering what I expected it be, twice `params[:my_number]`. What's wrong?
 
```
get "/double/:my_number" do
  input = params[:my_number]
  @double = 2*input
        
  erb :show
end
```

## API's 

* What is the difference between JSON and objects in ruby such as ruby hashes or ruby arrays?

Answer: JSON is a string that represents a set of objects.  A ruby hash or array can be represented with a JSON string but the string is not a hash or an array.  A hash is an object that associates keys with values and an array is an object that maintains a list of other objects.


## More Sinatra

* Why is my form not working?
    
```
<form action="get" method="/">
   <input type="text" name="my_name">
   <input type="submit" value="submit name">
</form>
```
 

## HTML/CSS, DOM
Find the 2 errors in this css file:
	
	div: {
	    color: red
	    float: left
	    }

What's the problem with the following HTML markup?

```
<html>
   <head>
      <meta charset="UTF-8">
      <title>Quiz Quiz Quiz</title>
    </head>
	<body>
	   <div id="someId">
	     I'm a Div!
	   </div>
	   <p class="someClass">
	     Lol
	    </p>
	   <h1 class="purple">
	     Blah Blah
	   </h1>
	   <div id="someId">
	     Hello
	   </div>
	            
    </body>
</html>
```

