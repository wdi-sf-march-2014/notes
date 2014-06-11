# Warm Up
## Warming up to JS



Let's assume I have the following code for the `each` iterator.

```
	var each = function(collection, action) {
	
		for(var i = 0; i < collection.length; i++) {
			var element = collection[i];
			action(element);
		}
		
		return collection;
	};

```

If you feel like you understand the code for `each` you should attempt one of the following options:

======

* Use `each` to write a `reverse` function that takes an array and returns a new one in reverse order.

	```
	var reverse = function(myArr){
		// Your code here
	}
	
	reverse(["larry", "curly", "moe"]) //=> ["moe", "curly", "larry"]
	```
* Use the idea for `each` to write an `eachWithIndex` function similar to the one in ruby. 
* Use `each` to write a `map` function that acts like the  `map` you used in ruby.
	* For example,
	 
		```
		var double = function(num){
			return num*2;
		}
		map([1,2,3], double) // => [2,4,6]
		```
* If you understand `map` and have written it then refactor the following code.

	```
	var myArr = [5,10,15,20];
	var lessThanTwenty = [];
	
	var dbl = function(num) {
		return num * 2;
	}; 
	
	var decrement = function(num) {
		return num - 1;
	};

	// Refactor the following using map
	//		Hint: Use map once.
	var dblArr = map([1,2,3], dbl);
	var decDbleArr = map(dblArr, decrement);

		
		
	```
	
======

If you don't feel comfortable with `each` try the following:


* Write a function that reverses an array.
* Write a function that returns a random number in a certain range:
	
	```
		var findRandom = function(low, high) {
			// Your code here
		};
	```
	(*Hint: use `Math.random`*)
* Write a function that acts like `sample` for arrays.