

my_arr = [1,1,2,3,5,8,15,23,38,61]

def binary_search(arr,target, left_index=0, right_index=nil)
    right_index ||= arr.length - 1
    mid_index = (left_index + right_index)/2

    if target == arr[mid_index]
       return mid_index
    elsif left_index > right_index
       return nil
    elsif target < arr[mid_index]
       return binary_search(arr,target,left_index, mid_index - 1)
    else
       return binary_search(arr,target, mid_index + 1, right_index)
    end
    	  
end


p binary_search(my_arr, 38)