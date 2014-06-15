# merge solution
# nested loops

def merge(arr_one, arr_two)
	index_one = 0 
	index_two = 0
	new_arr = []

	while index_one < arr_one.length
		while index_two < arr_two.length && arr_one[index_one] > arr_two[index_two]
			new_arr << arr_two[index_two]
			index_two += 1
		end
		new_arr << arr_one[index_one]
		index_one += 1
	end

	new_arr
end

