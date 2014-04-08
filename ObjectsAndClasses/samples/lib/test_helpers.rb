def printSuccess(message)
  puts "\e[#{32}mSUCCESS! : #{message}\e[0m"
end

def printError(message)
  puts "\e[#{31}mFAILED!  : #{message}\e[0m"
end

def printCompleteSuccess(message)
  puts "\e[#{32}m######################################################################\e[0m"
  puts "\e[#{32}mCONGRATULATIONS!!!\e[0m"
  puts "\e[#{32}m#{message}\e[0m"
  puts "\e[#{32}m######################################################################\e[0m"
end

def float_equal(a, b)
  if a + 0.00001 > b and a - 0.00001 < b
    true
  else
    false
  end
end
