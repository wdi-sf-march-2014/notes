
def flatten(arr)
  result = []
  arr.each do |item|
     item.kind_of?(Array)? result += flatten(item): result.push(item)
  end
  result
end


