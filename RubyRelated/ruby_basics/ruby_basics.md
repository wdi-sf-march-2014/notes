# Introduction to Ruby

## Objectives
 * Variables and assignments
  - Strings
  - Symbols
  - Fixnum, Float
 * Input and Output
 * Booleans
 * If statements
 * Loops

## Why Learn Ruby?
* It has learned/stolen a ton from the languages that came before it.
* It's elegant and easy to learn
* It doesn't focus on making code as short as possible, it cares about readability
* It has a huge community behind it - documentation, tutorials, etc.
* RAILS!
Ruby is a well designed object oriented language.  It is easy to read and stresses the DRY (Don't Repeat Yourself) principle.  Since many of the method names and the ruby syntax itself is so much like english, it is an ideal language to start with.


## My First Ruby App - basic Hello World
* Let's make a new folder for our ruby exercises:
  * ``mkdir ruby_exercises ``
* Make a new ruby file
  * ``subl ex1.rb``
* Add this to the file:
  * ``puts 'hello world'``
  * ``puts 'my name is Colt (or whatever your name is)'``
* Now let's run our code.  Execute it with:
  * ``ruby ex1.rb``
* Ok great, our first program!  Let's add a comment and then run our code:
  *   ``#this code won't run!``
* Now let's do something different
  * ``puts '2 + 2'``
* Oh now!  That's not what we want.  How can we get it to evaluate the expression?
  * ``puts 2+ 2``
* So what's the difference?  When we use quotes, we are making a **string**.  It's text and isn't evaluated.

##Let's talk about numbers and math!
So let's do some more math besides just ``2 + 2``

* To play around with some math expressions, we're going to use something called **IRB**.  It allows us to execute short bits of Ruby code without saving it to a file and running it in the terminal.
* In IRB we can evaluate simple expressions:

```
puts "This is IRB!"
5
1000009
```

So we have numbers!  We can do some operations with those numbers:

```
2+2
46-100
10*20
81/9
1/3 # notice what happens when we run this.
```

* We run into a problem!  That shouldn't be 0.  So what's going on?
* **Integers** are numbers without decimal points
* **Floating-Point Numbers** (floats) are numbers with decimal points

These expressions follow the order of operations.  So we can do something like:
``10 * (25 - 1)``

## EXERCISE TIME!
Write a program that outputs the number of minutes in a decade
``puts 60 * 24 * (365 * 10 + 2)``

## So let's go back to Strings
* Strings are basically groups of letters.  Things like:
  * `"Ruby is awesome"`
* As you've seen already we use `puts` to print things
* String Arithmetic.
  * You can sort of add 2 strings
    * `puts 'I like' + 'ice cream'`
  * We can also multiply them
    * puts "Hello World" * 100
  * Make sure we know the difference between numbers and digits:

    ```
    puts 2 * 5
    puts '2' * 5
    puts '2 * 5'
    ```

Which of the following will result in an error message?

```
  1.  2 + 8
  2.  3 * 10
  3.  4 ** 10
  4.  "abcde" * 3
  5.  "abcde" + 1
  6.  "abcde" + "fghij"
```

What if we want to print out the string "You're awesome"

``puts 'You\'re awesome'``

Ok, so what if we want to type the '\\' character like in 'Up\Down'

```
puts "up\\down"
puts "This should go on a \n new line"
```

#Symbols

Symbols are like strings, sort of.  Symbols are unchangeable.  They can only be overwritten.

They look like this:

```
:hello

Try doing this:
puts :hello << :world

This doesn't work because we cannot change symbols!
```
Check out the difference in how strings and symbols are stored.  Every string needs its own place in memory. Symbols don't.

```
puts "hello world".object_id
puts "hello world".object_id
puts "hello world".object_id

puts :hello.object_id
puts :hello.object_id
puts :hello.object_id
```

## Booleans
Booleans can only have 2 values.  TRUE or FALSE

```
100 > 1
60 < 20
```
## VARIABLES
So far, we've learned about data types, but we can't do anything with these values. Variables allow us to store values and use them later.  Here's a really simple example.

```
puts 'you can say that again'
puts 'you can say that again'
# We can use a variable to help us out here
#Variables have 2 parts - NAME and VALUE
my_string = 'you can say that again'
puts my_string
puts my_string
```
So we're storing a value in the computer's memory for later use.  You can think of it as  my_string is pointing to 'you can say that again'

Of course variables can point to any data type.  So let's try another example:

```
score_1 = 99.5
score_2 = 80
average = (score_1 + score_2)/2
**#what happens if we do this:**

puts  "The average test score is: " + average

It doens't work, so we need string interpolation!
puts "The average test score is #{average}"
```
**String Interpolation**

When naming variables, most Ruby programmers use **snake_case**

### Code Along
We are going to make a simple app that asks for your first name and greets you:

```
name = gets.chomp
puts "Hey there, #{name}"

```

Now on your own, let's adapt it so that it asks for our middle and last name as well.


## Some More String Methods

[RUBY DOCS](http://www.ruby-doc.org/)

```
first_name = "Tim"
last_name = "Garcia"

# This is an example of String concatentation
# full name will be "Tim Garcia"
full_name = first_name + " " + last_name

# This is an example of String interpolation
full_name = "#{first_name} #{last_name}"

# Returns the length of the string
full_name.length
# Also returns the length of the string literal
"Tim Garcia".length

# Returns full name but all characters in lower case.
# This does not save any changes to full_name iteself
full_name.downcase

# This will still print "Tim Garcia"
puts full_name

# Saves the downcased value of the string to full_name.
full_name.downcase!

# This will print "tim garcia", because of the call to downcase!
puts full_name

# String access.  full_name is once again Tim Garcia
full_name[0] = 'T'
full_name[4] = 'G'

# Will print 'a' to STDOUT.  'a' is the last character in the full_name String
puts full_name[-1]
```

#### Exercise
Let's add on to our greeter program.  Ask the user what city and state they live in.  Output the capitalized city name and all upercase state name.  Explore the Ruby docs to find out how to capitalize only the first letter.

**Code Along**
We'll make a simple app that asks the user how old they are.  It will then tell them how many seconds they have lived.

```
puts "How old are you?"
age = gets.chomp
age = age.to_i
seconds = age * 365 * 24 * 60 *60
puts "You've been alive for #{seconds} seconds"
```

## Quick Review of Expressions
What's the difference?

```
x = 5
x == 5
```

# Some Fun Boolean Exercises
![](https://draftin.com:443/images/13726?token=hrizspBIDql4wmnF-0hAPvFHyvmwbyLfw2biY3ouGw1n59KGHcuXJPCOWekdPE8KAdbfHikmQLJc01laiH2RR84)
**We can make decisions!  Add logic to our code**

```
if condition
   something happens
 end
```
So let's look a super basic example

```
if my_bank_account_balance > 50.00
   puts "I'm eating steak!"
else
   puts "I'm eating ramen :("
end
```
Now let's add **an else condition**

```
if my_bank_account_balance > 50.00
   puts "I'm eating steak!"
else
   puts "I'm eating ramen :("
end

```
 **Elsif Statements**

```
if my_bank_account_balance > 50.00
   puts "I'm eating steak!"
elsif my_bank_account_balance < 0
    puts "I'm eating paper"
else
   puts "I'm eating ramen :("
end

```
Since ruby is all about being human readable.  It also allows us to do one line control flow statements.

```
num = 10
max = 5

# Max is now 10
max = num if num > max
```
Also, since ruby is human readable, control flow statements generally have an opposite.  For if, the opposite is ```unless```

```
num = 1
min = 5

# Min is now 1
min = num unless num > min
```
Typically you use the control flow statements that sounds most natural in english.


### Exercise
Write a calculator program that takes a number, an operation +,-,/,*, then another number.  The program should be able to handle decimal numbers.  Below is sample output:

```
Enter a number, a +,-,/,*, then another number.
7
/
2
Result: 3.5
```

## Loops

Loops are essential to programming.  They allow us to repeat an operation many times.  Typically, execution of a loop lasts as long as a certain value holds true or as long as a set of data is being iterated over.  Below is an example of printing the values from 0 to 10 done using many different methods.  Note that 0..10 is a Range type, which was discussed earlier.

**For Loops**

```
for current_iteration_number in 1..100 do
   puts "Hello world, this is number #{current_iteration_number}"
end
```

### For Loops Exercise

Using a for loop, print out all even numbers between 1 and 1000

```
for i in 1..1000
   puts i if i % 2==0
end
```


**Times do loops**

```
9.times do
  puts "HELLO"
end
```

# Iterating with a while loop
```
x = 100
while x > 0
   x -= 1
   puts "This loop will run #{x} more times"
end

```

## While Loops


```
command = ''

while command != 'bye'
  puts command
  command = gets.chomp
end

puts 'Come again soon!'

```




# Iterating until a value is true
```

i = 0
num = 10

until i > num
  puts "The value of i is now #{i}"
  i += 1
end
```
