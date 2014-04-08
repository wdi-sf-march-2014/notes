# Ruby Methods - built in "dot" methods

# Student Learning Objectives: (5 min)

* <h3> By the end of this lesson you should be able to:

	* find the documentation for the .inspect method of a ruby array in the Ruby Docs (ruby-doc.org).
	* use .split() method to convert a sentence string into an array of individual words.
	* use the .each method to list out the elements in an array.
	* use the .each method to list out the key-value pairs of a hash.
	
	
# What are methods for:
* <h3> Methods are used to perform a small tasks or to return something, methods always return something.
* <h3> Built in methods extend the programming language


# Built in Methods:
* <h3> Built in methods are are invoked using the "dot notation"
* <h3> Strings: (10 min)
	* <h3> Exercise: Go to ruby-doc.org
	* click on 2.0.0 Core
	* scroll down to Classes "filter.....": enter String, click on String
	* find and read the .capitalize and .downcase
	
			"SomE fuNKY STRing".downcase  => "some funky string"
			
			"san francisco".capitalize => "San Francisco"
	
* <h3> Exercise 1: Built in String methods (10 min)
	* Go to ruby-doc.org
	* read docs on ".split" and ".join" 
	* Use ".split" to split the string "Hello, world!" into an array of characters.
	* Use ".join" to join the array of characters back into the string "Hello, world!"
	* Use ".split" to split the string "Programming in Ruby is fun." into an array of words.
	* Use ".join" to join the array of words back into the string "Programming in Ruby is fun."
	* if extra time, try out the extra built in String methods listed below.
* <h3> Exercise 1: (show solutions) (5 min)
	
* <h3> Arrays:  ( 15 min)
	* .length, .each and .map are perhaps the most used "dot" methods:

			array = [1,2,3,4,5]
			array.length
			=> 5
		
			array.each { |num| puts num * 2 }
			2
			4
			6
			8
			10
			=> [1, 2, 3, 4, 5]
		
			new_array = array.map { |num| num * 2 }
			=> [2, 4, 6, 8, 10]
			



		
* <h3> Exercise 2: Built in Array methods (10 min)
	* make an array containing the days of the week
		* print out the days of the week (hint: use .each)
	* make an array of numbers
		* create a new array of squared numbers (hint: use .map)
	* if extra time, try out the extra built in Array methods listed below.
* <h3> Exercise 2: (show solutions) (5 min)

* <h3> Hashes: (15 min)
	* .each is also very useful for hashes as well. 
	
			month_hash = { January: 31, February: 28, March: 31 }
		
			month_hash.each { |key,value| puts "The month of #{key} has #{value} days" }
		
* <h3> Exercise 3: Built in Hash methods (10 min)
	* make a hash of a user profile: :first_name, :last_name, :street, :city, :state, :zipcode, :phone, :email
	* make an array of keys and list them (hint: .keys, .each)
	* make an array of values and list them (hint: .values, .each)
	* list out the key value pairs of you profile hash (hint: .each)
	* if extra time, try out the extra built in Hash methods listed below.
* <h3> Exercise 3: (show solutions) (5 min)
	 
		
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

# Additional built in "dot" methods:
	
* <h3>String Methods:
	* .capitalize:  "hello".capitalize => "Hello"
	* .upcase: "Hello".upcase => "HELLO"
	* .downcase: "Hello".downcase => "hello"
	* .include?: "Hello".include?('e') => true	
	* .split(): "Hello".split("") => ["H", "e", "l", "l", "o"]
	* .join(): 	["H", "e", "l", "l", "o"].join("") => "Hello"
	* .reverse: "Hello".reverse => "olleH"

* <h3>Array Methods:
	* .length, .sort, .reverse, .sort.reverse, .include?, .empty?, 
	* .push: [1,2,3].push(4) => [1,2,3,4]
	* .pop: [1,2,3,4].pop => 4; your array is now: [1,2,3]
	* .unshift(): [1,2,3].unshift(0) => [0,1,2,3]
	* .shift: [0,1,2,3].shift => 0; your array is now: [1,2,3]
	* .delete_at(1): deletes the element at index 1
	* .delete(2): deletes all occurences of the number 2 from your array
	* .sort_by
	* .shuffle
	* .sample
	* .slice
	* .each {|element| code }
	* .each_index { |index| code }
	* .each_with_index { |element, index| code }
	* array.reject {|e| e > 3 } => removes any element greater than 3
	* .flatten: flattens multidimensional array
	* .inject: array.inject(initial_value) { |sum, element| sum += element }

* <h3>Hash Methods:
	* hash.key(value) => returns the key
	* hash.keys => returns an array of keys
	* hash.values => returns an array of values
	* .to_a => converts hash to a multidimensional array of key value pairs: [[key1, val1],[key2, val2],...]
	* .has_key(:first) => T/F
	* hash = {first: "Mickey", last: "Mouse", address: "Disneyland"}
	* .has_value?("Mickey") => T/F
	* .find
	* .find_all: hash.find_all { |k,v| v.match("Mickey") } => [[:first, "Mickey"]]

	
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

## Cool Stuff:
####SizeUp: Split Screen - http://www.irradiatedsoftware.com/sizeup/
####Sublime 2 Tutorial: Tuts+: https://tutsplus.com/course/improve-workflow-in-sublime-text-2/


