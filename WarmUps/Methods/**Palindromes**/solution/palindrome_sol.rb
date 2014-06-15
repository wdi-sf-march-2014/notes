# solution 1
# 	looping
def is_palindrome(word)
	index = 0
	length = word.length
	check_chars = true
	while(index < length/2 && check_chars)
		check_chars = word[index] == word[length - index - 1]
		index += 1
	end
	check_chars
end

def print_example
	words = ["dog", "bob", "toot", "racecar"]
	words.each do |word|
		puts "it is \033[31m#{is_palindrome(word)}\033[0m that \033[34m#{word}\033[0m is a palindrome"
	end
end

print_example