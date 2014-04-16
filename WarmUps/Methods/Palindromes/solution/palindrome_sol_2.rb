# solution_2
# recursive

def is_palindrome(word, index=0)
	# terminal condition or stopping point
	if index == word.length/2
		# return true when at middle
		# 	of word
		return true
	# terminal condition or stopping point
	elsif word[index] !=  word[word.length - index - 1]
		# return false if ever two 
		# 	chars don't match
		return false
	# recursive condition
	else
		# check next pair of characters
		return is_palindrome(word, index + 1)
	end
end

def print_example
	words = ["dog", "bob", "toot", "racecar"]
	words.each do |word|
		puts "it is \033[31m#{is_palindrome(word)}\033[0m that \033[34m#{word}\033[0m is a palindrome"
	end
end

print_example