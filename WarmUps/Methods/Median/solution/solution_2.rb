def median(arr)
    mid_index = arr.length/2
  
    less_than_pivot = []
    equal_to_pivot = []
    greater_than_pivot = []
    pos_right = 0    

    result = nil
    search_arr = arr
    while result.nil?
    	pivot = search_arr.sample()
       	search_arr.each do |number|
	   if number < pivot
	      less_than_pivot << number
	   elsif number > pivot
	      greater_than_pivot << number
	   else
	      equal_to_pivot << number
	   end
	end

	if mid_index <= pos_right + less_than_pivot.length - 1
	  search_arr = less_than_pivot
	elsif mid_index > pos_right + less_than_pivot.length + equal_to_pivot.length - 1
	  pos_right += less_than_pivot.length + equal_to_pivot.length
	  search_arr = greater_than_pivot
	else
	  result = pivot
	end
	less_than_pivot = []
	equal_to_pivot = []
	greater_than_pivot = []
    end 
    result
end