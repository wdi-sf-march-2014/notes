
def compress(word)
  indexOne = 0
  indexTwo = 1
  result = ""
  while(indexOne < word.length)
    while(word[indexOne] == word[indexTwo] && indexTwo < word.length)
      indexTwo += 1
    end
    if(indexTwo - indexOne > 1)
      result += (indexTwo - indexOne).to_s
    end
    result += word[indexOne]
    indexOne = [indexTwo, indexTwo += 1][0]
  end
  result
end
