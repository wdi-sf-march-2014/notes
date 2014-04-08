#Custom Methods

## Programming Mantra: "DRY" 
## "Don`t Repeat Yourself"
###If you find repeating lines of code in your program, you should put them into a method.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Student Learning Objectives: 

* <h3> By the end of this lesson you should be able to:

	* write a custom method that takes variables as arguments.
	* write a custom method that takes an array as an argument.
	* write a custom method that takes a block as an argument.
	* create a command line menu

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


###Define methods with the "def" keyword:

		def hello_world()
		  puts "Hello World!"
		end

### Call (invoke) method using ().

		hello_world()
		=> Hello World!


#### Go to Gist, clone file 
	
	$ irb
	> load './methods.rb'
	Ruby Methods
	=> true

## Method with no arguments - three different styles

	# Return a local variable
	def add_two_variables()
	  num1 = 3
	  num2 = 4
	  result = num1 + num2
	  return result
	end
	
	puts add_two_variables()
	# 7
	
	# Return an expression
	def add_two_variables()
	  num1 = 4
	  num2 = 5
	  return num1 + num2
	end
	
	puts add_two_variables()
	# 9
	
	# Implicit Return - Ruby returns the last statement in a method implicitly
	def add_two_variables()
	  num1 = 5
	  num2 = 6
	  num1 + num2
	end
	
	puts add_two_variables()
	# 11


## Method with 2 numeric arguments
	
	# Returns the sum of two numeric arguments
	def add_two_arguments(num1, num2)
	  num1 + num2
	end
	
	# Addition of Fixnums (Integers)
	puts add_two_arguments(5,6)
	# => 11
	
	
	# Addition of Floats
	puts add_two_arguments(3.3, 4.1)
	# => 7.3999999999999995
	
	
	# Need to add the ".round(2)" method for 2 decimal places 
	puts add_two_arguments(3.3, 4.1).round(2)
	# => 7.4
	
## Method with 2 numeric arguments - one has default value
### the default value can be over written

	# Returns the sum of two numeric arguments
	# If only one parameter is passed, num2 is set to 3
	def add_two_arguments(num1, num2 = 3 )
	  result = num1 + num2
	  return result
	end
	
	puts add_two_arguments(2)
	# 5
	
	pust add_two_arguments(22, 44)
	# 66
	
## Exercise 1:
#### Write a method that returns the product of 2 arguments rounded to two decimal places.

## Method with an array argument

	    
    number_array = [1, 2, 3, 4, 5]
         
    def print_array2(arr)
      i = 0
      while i < arr.length
        puts arr[i]
        i += 1
      end
    end
    
    def print_array(arr)
      arr.each do |element|
        puts element
      end
    end    
    
    def print_array(arr)
      arr.each { |element| puts element }
    end  

    
## Exercise 2:
#### 1. Using a while loop, write a custom method that returns the sum of all the elements in an array.
#### 2. Investigate the ".inject" method in the Ruby docs. Re-write the previous custom method using Ruby's ".inject" method. 


## Block Styles: { }, do-end
#### Ruby convention: use {} for a single line block, use do-end for multi-line blocks.
	array.each { |element| puts element }
	
	array.each do |element|
	  element += 10
	  puts element
	end
	
## Method being passed a block.

	def calculate_block(num1, num2)
	  yield num1,num2
	end
	
	puts calculate_block(3,4) {|mynum1, mynum2| mynum1 + mynum2 }
	
	
## Example Command Line Menu

	def menu
	  puts `clear`
	  valid_selection = false
	  while !valid_selection
    	puts "Select an option:"
        puts "  1) Option 1"
        puts "  2) Option 2"
        puts "  3) Option 3"
        puts "  Q) Quit"
        puts "Enter an option: "
        selection = gets.chomp.upcase

        case selection
        when "1"
          puts `clear`
          puts "You selected Option 1"
        when "2"
          puts `clear`
          puts "You selected Option 2"
        when "3"
          puts `clear`
          puts "You selected Option 3"
        when "Q"
          valid_selection = true
          puts `clear`
          puts "Goodbye"
        else
          puts `clear`
          puts "You did not select a valid option"
        end # case
        
	  end # while
	end

    menu()

## Exercise 3:

#### 1. Create a four function calculator that runs from a command line menu. Create a calculate method or methods that get called from your case statement.