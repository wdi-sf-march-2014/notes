puts "Ruby Methods"

# Return a local variable called "result"
def add_two_variables()
  num1 = 3
  num2 = 4
  result = num1 + num2
  return result
end

puts add_two_variables()
# 7

# Return an expression, no need to have the local variable "result"
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

################### 
# Method receives two arguments and returns their sum.
def add_two_arguments(num1, num2)
  num1 + num2
end

# Add two integers
puts add_two_arguments(5,6)
# => 11

# Add two floats
puts add_two_arguments(3.3, 4.1)
# => 7.3999999999999995

# Add two floats with rounding
puts add_two_arguments(first_number, second_number).round(2)
# => 7.4

##################
