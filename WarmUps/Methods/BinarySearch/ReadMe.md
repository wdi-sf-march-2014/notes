# Warm up
## Binary Search

Given a sorted array we want to check if a value is in the array. The benefit of the array being sorted is that we can strategize how we search through the array. Normally we might just iterate through an array to find a value, *linear search*, but with a *binary search* we consistently reduce our search area by half the size of the current array to find things much more quickly.

For example: 

	my_arr = [1,1,2,3,5,8,15,23,38,51]
	
	
	
	
and assuming we want to check if `23` is in `my_arr` we begin as follows:

1. search `[1,1,2,3,5,8,15,23,38,51]` for `38`.
2. search `[8,15,23,38,51]` for `38`.
3. search  `[38, 51]` for `38`, and returns true.


What's happening?

* First we checked if `38` is less than or equal to the value  at the index of `my_arr.length/2` (is `38 <=  5`?) and if it's not we search the right half of the array.

* Now we search for `38` in the right half of the array

		[8,15,23,38,51]
* Then we ask is `23` less or equal to `38`, and since it isn't we search the right half of the current array,
		
		[38,51]
* Now we check if `38` is less than equal to `38`, and stop our search because it is, returning `true`.

