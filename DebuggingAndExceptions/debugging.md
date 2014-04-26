# Debugging and Exceptions

## Agenda
1. Debugging Philosophy and Techniques
1. Basic Errors and Reading an Exception
1. Methods and the Stack, Reading a Backtrace
1. Error Classes, Raising and Rescuing
1. More Debugging Techniques, a Glimpse of Testing

## Debugging in the Abstract

### Why a Debugging Lesson?

You've been debugging but mental discipline and better technique can make debugging faster and easier.  It is impossible to write programs without writing bugs, so it is impossible to write programs without debugging, and you will be debugging every day.

### What is a bug?

The computer can't distinguish between code we wrote by mistake and code we wrote deliberately.  Every time you write code that does not have syntax errors you are producing a program, it just wasn't the one that you wanted.  A program with a bug is a program whose behavior is different from what the programmer intended, or from what the user expected.  The term "bug" dates back at least to to the 1870s, when Thomas Edison wrote:

>It has been just so in all of my inventions. The first step is an intuition, and comes with a burst, then difficulties arise — this thing gives out and [it is] then that "Bugs" — as such little faults and difficulties are called — show themselves and months of intense watching, study and labor are requisite before commercial success or failure is certainly reached.[3]

Edison didn't write code, but bugs are not specific to code, they are a result of humans attempting precise intellectual work.

### Why do we write bugs? (How can we stop?)

Bugs can be very different from each other, both in their causes and their manifestations.  Most bugs are small errors like typos, or substituting one method name for another.  Some bugs are errors in logic.  Their symptoms can vary from clear errors to subtle changes in program behavior.  The common thread is that we as humans are not precise, logical thinkers, and computer programs that we write reflect our lack of precision by being wrong.

Some bugs are moths (from William Burke, popularized by Grace Hopper):

![Some bugs are moths.](http://places.designobserver.com/media/images/townsend-smart-3_525.jpg "Some bugs are moths.")

### Design before Code

Bugs happen when intention and code separate.
Without clear intentions and a plan for the logical structure of your program, bugs are inevitable.
Plan out your program on a whiteboard or a notebook before starting to code.  Use pseudocode so you are only thinking about the logic of the program.  Consider several different inputs to your program.  How will the control flow in the program with each different input?


Let's write some pseudocode for a function which takes a filename for a story and returns a story hash, assuming that the first room is always the first entry in the file.

### Be Systematic

Figure out where the behavior of the program departs from your mental model of the program.  Use print statements and the debugging console to look at the state of the program as it changes.  If the state is correct at one line, and wrong later, the error must happen in between.

#### Pause Execution with binding.pry

```
require 'pry'
binding.pry
```

#### Print State with puts

```
puts "variable_name is: #{variable_name}"
```

### Be Critical

When you are debugging your own code, the veil of the code you meant to write will always be hanging in between you and the code you wrote.  When working on a subtle bug, it often helps to forget about what you were trying to do and work on learning why the system that you have behaves the way it does.

### Use Git

Commit constantly.  You should commit whenever you make a change that works.

## Exceptions: What do they Mean?

####SyntaxError
SyntaxError is raised when Ruby does not recognize the code you've given as valid Ruby code.  It often indicates a typographical error like a missed parenthesis.

```
if true
)
end
```
`file.rb:2: syntax error, unexpected ')'`

What was left unclosed or inappropriately opened?
What is the line number?  The line number is where Ruby first _noticed_ that there was a problem, not where the problem occured.

####NoMethodError
`[1,2,3] / 3`
```file.rb:5:in `<main>': undefined method `/' for [1, 2, 3]:Array (NoMethodError)```

The object `[1,2,3]` has no method `/`, so we get an error.

You might have misspelled the name of a method, or you might have a different sort of object than you expected.

####NoMethodErrror for nil:NilClass
```
file = File.open("thedatafile")
puts @file.gets
```
```errors.rb:9:in `<main>': private method `gets' called for nil:NilClass (NoMethodError)```

At some point we are calling `gets` on `nil`.  The exception says line 9, so look there.

####ArgumentError
`Integer("hey")`

`ArgumentError: invalid value for Integer(): "hey"`

The Integer constructor raises an error because there is no sensible way to interperet `"hey"` as an integer.

####NameError
```
class Blender
  ...
end

blender.new
```

```NameError: undefined local variable or method `blender' for main:Object```

Read exceptions deliberately.  An unexpected exception almost certainly indicates that the program you wrote differs from the program you envisioned, or the input you are getting differs from the input you envisioned.


### Invariants (More systematic thinking)

Pick a line in your code.  What are the values of the variables at that line?  Pick a line in a loop.  What is true at that line in every iteration of the loop?

```
def find_max(list)
  max = list[0]
  for i in 1...list.length
    # What can we say about the relationship between
    # i, max, and the list at this line?
    max = list[i] if list[i] > max
  end
  max
end
```
What assumptions does this program make about its input?

### Avoid magical thinking and random programming

Have total faith in the determinism of the system you are manipulating.  It is easy to get frustrated, start feeling like programming is magical and focus won't help you get through your work.  Without confidence that the problems you encounter can be solved, you may never solve them.  The blessing and curse of programming is that our problems are almost always our own fault.


**Code Along Exceptions**

    print "What do you want to divide by? "
    number = gets.to_i
    puts "The result of 3 div #{number} is #{3/number}"

This works unless our user enters 0 or a string, then we get an error. This error message isn't a very friendly interaction for our user.

This is a time when we would want to use an exception.

*An exception is a special kind of object, an instance of the class Exception or a descendant of that class that represents some kind of exceptional condition; it indicates that something has gone wrong. When this occurs, an exception is raised (or thrown).*
- http://rubylearning.com/satishtalim/ruby_exceptions.html

    begin
      print "What do you want to divide by? "
      number = gets.to_i
      puts "The result of 3 div #{number} is #{3/number}"
    rescue
      puts "Wow, your code just exploded!"
      retry
    end

Awesome! Now if our user makes a typo they can try again.

However, it's good to double check that all of our code was executed. For this we can use `ensure`

```
    begin
      print "What do you want to divide by? "
      number = gets.to_i
      puts "The result of 3 div #{number} is #{3/number}"
    rescue
      puts "Wow, your code just exploded!"
      retry
    ensure
      puts "I need to make sure this is run..."
    end

```
