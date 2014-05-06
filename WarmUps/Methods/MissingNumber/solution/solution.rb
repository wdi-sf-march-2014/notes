

numbers = (1..100).to_a

numbers = numbers.shuffle()
puts "should find #{numbers.pop()}"

def find_missing_number(arr)
    sum = arr.inject {|acc, x| acc + x }
    expected_sum = 50*101 - sum 
end

puts "found #{find_missing_number(numbers)}"