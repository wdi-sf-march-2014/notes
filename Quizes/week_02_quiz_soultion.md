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

__Answer:__

```
describe Triangle do 
  before(:each) do
    @triangle = Triangle.new(4,8)
  end 
  
  it "should have a base" do  
    expect(@triangle.base).to eq(4)
  end
  
  it "shoud have an area of 4" do
    expect(@triangle.area).to eq(16)
  end
end
```


## Algorithms 
* How can you tell if a method you are looking at is recursive or not?

__Answer:__

A method which calls itself, is recursive

__Given the following code__

```
def foo (x)
  puts x
  foo(x - 1) unless x == 0
end

foo 9
```

* What will the screen output of this code be?

__Answer:__

```
9
8
7
6
5
4
3
2
1
0
```


* What is the return value of ```foo 9```


__Answer:__

nil



## Iterators
* What would be the output of the following  

	    def my_func
	        yield "Hello"
	    end
    
    	person = "john"
    	my_func {|greeting| puts "#{greeting}, #{person}" }
    	
__Answer:__

```
Hello, john
```

* Why does the block have access to the person variable

__Answer:__


The block has access to the variables that are in the surrounding scope.  The block is taking advantage of an enclosure.


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

__Answer:__

```
class ArrayContainer
  def initialize(arr)
    @arr = arr
  end
  
  def each &block
    i = 0
    while i < @arr.length
      yield @arr[i]
      i += 1
    end
    @arr
  end
end
```	

## HTTP request and response

* Define Server

__Answer:__ A computer that responds to http requests on some port

* Name one thing that goes in a HTTP request header

__Answer:__ Headers such as Cookie, Accept, Accept Encoding, Control-Cache, Host, Referer.  Also, the HTTP verb (GET or POST for example) and URI (path) of the request.  Also, the request body.  In the case of a GET request, a body is not common.

* Name one thing that could come in an HTTP response body

__Answer:__ Any data.  A response body could have html, css, a jpeg image, an audio file, etc.

4. Name one status code that could come in an HTTP response header

__Answer:__ [RFC for Response Codes](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)


## Intro Sinatra

   * My view is not rendering what I expected it be, twice `params[:my_number]`. What's wrong?
 
```
get "/double/:my_number" do
  input = params[:my_number]
  @double = 2*input
        
  erb :show
end
```

__Answer:__

There is a type error because input is a string.  To fix the bug the code must be ```@double = 2 * input.to_f```.

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
        
__Answer:__
The action and the method have be switched incorrectly.  The form should be the following:

```
<form action="/" method="get">
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
	    
__Answer:__

There shouldn't be a colon after div and there should be a semi colon after red.

```
div {
  color: red;
  float: left
}
``` 

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
__Answer:__

The ```someId``` id is used more than once.  You should never name 2 different html elements by the same id.
