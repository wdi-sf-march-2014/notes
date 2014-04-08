# Ruby Arrays And Hashes

## Objectives

* Get comfortable with using
    * Arrays
    * Hashes
* Understand how arrays and hashes work internally

## What are data structures?
A data structure is a way to organize the data in your program.  Some data structures organize data better than others for doing particular tasks.  For example, arrays can look up an item quickly, given the index in the array.  Hashes allow the coder to quickly look up a value given a key.

## Arrays

__What is an array?__

It is a data structure that holds a set of objects.  The array maintains order.  Read more about arrays in the [ruby docs for arrays](http://www.ruby-doc.org/core-2.1.1/Array.html)

__How can I create an array?__

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

__How do I put data in and take data out of an array?__

The ```push``` method adds an object to the end of an array and the ```unshift``` method adds data to the front of the array.

```
arr = []
arr.push "a string"
arr.push "another string"
puts arr # My array is now ["a string", "another string"]
```


#### Exercise

Look at the ```pop```, ```shift```, ```insert``` and ```delete_at``` methods in the [array docs](http://www.ruby-doc.org/core-2.1.1/Array.html).  Try them out in pry.  What do they do?


__Accessing Arrays__

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

A hash is another data structure that associates a key to a value.  It is good at doing lookup operations quickly.

__Creating a hash__

Here is an example of creating hashes:

```
h = Hash.new
h = {}
h = {"Tim" => "instructor"}
```
__Accessing the Hash__

```
students = {14593 => "Tim Garcia", 57849 => "Alex Notov"}
students[14593] # Returns the value "Tim Garcia"

last_names = {:Tim => :Garcia }

# This is the same as the previous hash example
last_names = { Tim : :Garcia }
```

__Adding Key, Value Pairs to the Hash__

```
students = {14593 => "Tim Garcia", 57849 => "Alex Notov"}
students[89329] = "Delmer Reed"  # Adds 89329 => "Delmer Reed"
students[89329]                  # Returns "Delmer Reed"
```



# Resources

* [Array docs](http://www.ruby-doc.org/core-2.1.1/Array.html)
* [Hash docs](http://www.ruby-doc.org/core-2.1.1/Hash.html)
* [More information on how hashes work](http://www.sparknotes.com/cs/searching/hashtables/section1.html)



