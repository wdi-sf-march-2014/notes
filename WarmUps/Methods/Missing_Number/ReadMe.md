# Warm Up
## Missing Number

You are given a bucket full of cardboard numbers from `(1..100)`, and as you're walking home with them, you trip, spilling them all over the street. You manage to quickly pick them up, but not before one flys away in the wind. UH-oh!! 

People are *counting* on you to deliver *all* the numbers. It would take forever to recut out all the cardboard numbers, and you are inspired to write a program to help you.

It starts like the following

`missing_number.rb`

	numbers = (1..100).to_a
	
	numbers = numbers.shuffle()
	numbers.pop()
	
	def find_missing_number(numbers)
		# Your code here
	end