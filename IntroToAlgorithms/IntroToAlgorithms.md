Introduction To Algorithms
==================

![Tahoe Rocks](http://clients.stujophoto.com/photos/i-gVgFLvQ/5/L/i-gVgFLvQ-L.jpg)

Time for some computer sciencey stuff!
#Objectives
* Understand the difference between __Iteration__ and __Recursion__
* Define an Algorithm
* Demonstrate the Bubblesort Algorithm
* Recognize the __big O__ notation
	* O(1)
	* O(log N)
	* O(N)
	* O(N ^ 2) - N-Squared

#Recursion and Iteration

* Problem statement print the numbers from 0 through 9 in order

__Try This at Home__

##Iteration
Iteration uses a loop statement

```
def printx_loop (x)
  x.times do |xn|
    puts xn
  end
end

printx_loop 10

```
##Recursion
Recursion occurs when a function calls itself

```
def printx_recursion (x)
   printx_recursion(x - 1) unless x == 0
   puts x
end

printx_recursion 9

```

#What is an Algorithm?

* A definition of __How__ to do something
* Always Produces the Same Results for a given set of inputs
* The Input(s) are clearly defined - along with any pre conditions
* The Output is clearly defined
* Always ends (or terminates) at some point

#Eat your Veggies

* BubbleSort - O(N^2)
* MergeSort - O(NlogN)
* [Sorting Algorithms in Ruby](http://jlarusso.github.io/blog/2013/04/30/sorting-algorithms-in-ruby/)

#Examples of Algorithms

* [Fisher Yates Shuffle](http://bost.ocks.org/mike/shuffle/)
* [Dijkstra's Shortest Path](http://en.wikipedia.org/wiki/Dijkstra's_algorithm)

# What is Algorithmic Complexity?

Often in software engineering, we need to choose between algorithms and data structures which are suited to different tasks.  

We need to analyse our own tasks, and the data we will be using, and make informed decisions about what tools to use.  

Sometimes one tool is better in every way than another, but more often we have to sacrifice memory use for computation speed, or sacrifice speed of deletions to increase speed of insertions, and so on.

# Why do we care?

* First, it is important that the algorithms used in our applications will behave well as the amount of data our application is operating on increases. 

* Second, you will get these sorts of questions in interviews!

#Example

 For instance, in the absence of indexing, a database feature we will talk about next week, the ActiveRecord code `User.where(:name => "Delmer")` will take `O(n)` time.  This means that if the number of users in our database doubles, it will take twice as long to find Delmer.  
 
 With indexing, this will take `O(log(n))` time, meaning that the amount of time used to find Delmer will double if the number of users in our database is __squared__.  
 
 This is the difference between the app collapsing into a slow and unresponsive grave when the number of users gets to thousands and the app continuing calmly to a hundred thousand or a million users.


#The Big O

It's EASY! Just read this:

* [Big O Notation](http://en.wikipedia.org/wiki/Big_O_notation)

# How is the Big O of a procedure calculated?

1. We consider all possible input to the algorithm, and choose the one which will perform the worst.  Then consider the algorithm line by line.

2. For a linear loop which goes through each piece of the input, multiply the operations inside of that by the size of the input (usually called N).

3. For a loop which chooses a section of the input, then focuses in on that section, that will be log time.

# Some Complexity Classes:
* O(1) - Constant Time
   * Get the first value of a list
   * Random sample from a list

* O(logN) - Logarithmic Time 
   * Typical of algorithms that divide the input, then look at one of the sections
   * Searching sorted data

* O(N) - Linear Time 
   * For each ....
   * Sum an array
   * Find the max of an unsorted array

* O(NlogN) - N Log Time
   * Sorting with quicksort, merge sort

* O(N^2) - Quadratic Time
   * For each piece of data, look at the rest of the list
   * Insertion Sort
   * Selection Sort
   * Bubble Sort
   * List all pairs in a dataset
   * Dijkstra's algorithm without a priority queue
   
* O(N!) - List all combinations of a set, every possible subset.  
  * Impossibly slow and hardly ever needed.
  * Naive travelling salesman
  
# Algorithm Cheat Sheet

* [http://bigocheatsheet.com/](http://bigocheatsheet.com/)


#Algorithm and RSpec Lab

* Don't expect to finish everything, but practice as much as you wish

* [algorithms-ruby-lab](https://github.com/stujo/algorithms-ruby-lab)

* There is a secret bonus lab if you're interested so ask!

  
# Resources:
* Good introduction to complexity analysis by Dionysis Zindros [http://discrete.gr/complexity/](http://discrete.gr/complexity/)
* Overview of selected data structures, operations, and their complexity: [http://bigocheatsheet.com/](http://bigocheatsheet.com/)
* The classic Algorithms textbook by Cormen, Leierson, Rivest, and Stein: [http://mitpress.mit.edu/books/introduction-algorithms](http://mitpress.mit.edu/books/introduction-algorithms)
* MIT notes on Big O: [http://web.mit.edu/16.070/www/lecture/big_o.pdf](http://web.mit.edu/16.070/www/lecture/big_o.pdf)
* http://www.cs.dartmouth.edu/~dwagn/research/ordernotation.html
* http://blog.codinghorror.com/the-danger-of-naivete/
* http://bost.ocks.org/mike/shuffle/
* http://jlarusso.github.io/blog/2013/04/30/sorting-algorithms-in-ruby/
* http://en.wikipedia.org/wiki/Scope_resolution_operator#Ruby



