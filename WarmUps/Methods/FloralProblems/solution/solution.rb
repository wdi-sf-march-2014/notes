def gcd(a,b)
  if b == 0
    return a
  else
    gcd(b,a%b)
  end
end

def getBouquetArrangment(begonias, gardenias, petunias)
  gcdOne = gcd(begonias, gardenias)
  gcdTwo = gcd(petunias,gcdOne)
  [begonias/gcdTwo, gardenias/gcdTwo, petunias/gcdTwo] 
end
