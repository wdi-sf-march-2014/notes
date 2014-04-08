# Ruby Arrays And Hashes

## Objectives

* Create arrays, Modify arrays
* Create hashes, Modify hashes
* Understand how arrays and hashes work internally

## What are data structures? Why do we use them?
A data structure is a way to organize the data in your program. Typically the data that needs to be organized is a related set of items.  For example, all of the students in a class, or all of the test scores for a quiz.  Some data structures organize data better than others for doing particular tasks.  For example, arrays can look up an item quickly, given the index in the array.  Hashes allow the coder to quickly look up a value given a key.  

## Arrays
________________________________

### What is an array?

It is a data structure that holds a set of objects.  The array maintains order.  Read more about arrays in the [ruby docs](http://www.ruby-doc.org/core-2.1.1/Array.html)

### How can I create an array?

To create a new array, do one of the following:

```
arr = Array.new

```
__OR__

```
arr = []
```
The previous two examples achieve the same thing.

To create new array with data already populated you can do the following:

```
arr = [2,4,21,3]
```
Now the array has the values 2, 4, 21, and 3 in that order.

### How do I put data in and take data out of an array?

The ```push``` method adds an object to the end of an array and the ```unshift``` method adds data to the front of the array.

```
arr = []
arr.push "a string"
arr.push "another string"
puts arr # My array is now ["a string", "another string"]
```


#### Exercise

Look at the ```pop```, ```shift```, ```insert``` and ```delete_at``` methods in the [array docs](http://www.ruby-doc.org/core-2.1.1/Array.html).  Try them out in pry.  What do they do?


### Accessing Arrays

To access values in the array, you can use the ```[]``` method.  The bracket method gets a value from the array at a given index.  Arrays are indexed by integers, starting with 0. To get the first value in the array, you would pass 0 in to the bracket method.  See the examples below:

```
arr = [2,false,"a string", 0]
arr[0] # Returns 2
arr[1] # Returns false
arr[2] # Returns "a string"
arr[3] # Returns 0
arr[-1] # Returns 0
arr[-2] # Returns "a string"
arr[-3] # Returns false
arr[-4] # Returns 2
```
Ranges could also be passed into the ```[]``` method:

```
arr = [2,false,"a string", 0]
arr[0..1] # Returns a new array [2,false]
```

### Finding Values In Arrays

The  ```index``` method can help find values in an array.

```
arr = [3,6,2,11,106,23,8]
arr.index(11)		       # Returns 3, the index of the value 11
arr.index(0)			   # Returns nil, no index was found

arr.index { |x| x > 10 }  # Returns 3, the index of the first match
```

#### Exercise

Add the following arrays to pry:

```
arr1 = [7,11,32,98,0,-1]
arr2 = [98,50,-12,4,7]
```

What does the ```&``` method do on an array?

### Array Iteration

Arrays can be iterated over with standard loops:

```
arr = [4,3,8,9]
for i in arr
  puts i
end

j = 0
len = arr.length
while j < len
  puts arr[j]
  j += 1
end
```

There are also methods on arrays that can do iteration:

```
arr = [4,3,8,9]
arr.each { |item| puts item }

# Another way of doing the same thing
arr.each do |item|
  puts item
end

arr.each_with_index |item, index|
  puts "Item: #{item}, Index: #{index}
end
```


#### Exercise

Write a program that prints out the average number in an array.  Do not use the array average method.  Implement the logic yourself.  Make sure to think about the problem first before you start coding.

### How does an array really work?

Intnernally, an array takes up a continuous block of memory.  Accessing any one item in the array is very quick since the computer knows where the array is in memory and what offset the given index is at in memory.

Also internally, the size of the array must be defined when the array is created.  For example, the following code:

```
arr = []
```
The previous example creates an empty array that reserves some number of spaces for the array in memory.

When you use the ```push``` method and add values to the end of the array, at some point, the array will have to manage growing larger intnerally.

## Hashes
_____________________________

A hash is another data structure that associates a key to a value.  It is good at doing lookup operations quickly.

### Creating a hash

Here is an example of creating hashes:

```
h = Hash.new
h = {}
h = {"Tim" => "instructor"}

# Similar to the previous example but uses symbols
h = { :Tim => :instructor }
h = { Tim: :instructor }
```

### Accessing the Hash

```
students = {14593 => "Tim Garcia", 57849 => "Alex Notov"}
students[14593] # Returns the value "Tim Garcia"

```

### Adding Key, Value Pairs to the Hash

```
students = {14593 => "Tim Garcia", 57849 => "Alex Notov"}
students[89329] = "Delmer Reed"  # Adds 89329 => "Delmer Reed"
students[89329]				  # Returns "Delmer Reed"

last_name = { Garcia: 14593 }
last_name[:Garcia]			   # Returns 14593
```

#### Exercise

Given the following complex object:

```
complex_hash = {"Animals"=>
				[{"name"=>"Fluffy", "age"=>5, "species"=>"dog"},
				 {"name"=>"Buster", "age"=>10, "species"=>"cat"},
				 {"name"=>"Mochi", "age"=>4, "species"=>"dog"},
				 {"name"=>"Russel", "age"=>5, "species"=>"dog"}],
				"Clients"=>
				  [{"name"=>"Tim", "num_children"=>0},
				   {"name"=>"Angelina", "num_children"=>6}]}
```

Copy and paste the code into pry.  Do the following tasks in pry:

1. Print Angelina's number of children
2. Print all of Mochi's information (name, age, species).
3. Access the array of clients
4. (BONUS) Print out all the animal names that are dogs.


### has_key?

Sometimes it is useful to see if a key exists in your hash.  For example, you may want to check if a student id exists before using it.

```
students = {14593 => "Tim Garcia", 57849 => "Alex Notov"}

id = 88888

if students.has_key? id
  puts "ID: #{id}, Name: #{students[id]}"
else
  puts "Student not found"
end

```

### Iterating over Hashes

```
my_hash = {true: 20, false: 50}

my_hash.each do |key, value|
  if key
	puts "#{key} => #{value}"
  end
end
```

#### Exercise

Given a phrase from the user, print out the count of occurences of each letter.  The sample input and output is below.

```
Enter a phrase:
This is an exercise
T => 1
h => 1
i => 3
s => 3
a => 1
n => 1
e => 3
x => 1
r => 1
c => 1
```





# Resources

* [Array docs](http://www.ruby-doc.org/core-2.1.1/Array.html)
* [Hash docs](http://www.ruby-doc.org/core-2.1.1/Hash.html)
* [More information on how hashes work](http://www.sparknotes.com/cs/searching/hashtables/section1.html)



