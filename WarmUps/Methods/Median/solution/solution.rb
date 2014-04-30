

def median(arr, mid_index=nil, pos_right=0)
    mid_index ||= arr.length/2
    pivot = arr.sample()
    less_than_pivot = []
    equal_to_pivot = []
    greater_than_pivot = []

    arr.each do |number|
        if pivot > number
	       less_than_pivot << number
	   elsif pivot < number
	       greater_than_pivot << number
	   else
	       equal_to_pivot << number
	   end
    end

    if mid_index <= pos_right + less_than_pivot.length - 1
       median(less_than_pivot, mid_index, pos_right)
    elsif mid_index > pos_right + less_than_pivot.length + equal_to_pivot.length - 1
       pos_right += less_than_pivot.length + equal_to_pivot.length 
       median(greater_than_pivot, mid_index, pos_right)
    else
	return pivot
    end
end