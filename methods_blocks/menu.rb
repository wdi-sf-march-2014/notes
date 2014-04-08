def menu
  puts `clear`
  valid_selection = false
  while !valid_selection
    puts "Select an option:"
    puts "  1) Option 1"
    puts "  2) Option 2"
    puts "  3) Option 3"
    puts "  Q) Quit"
  
    puts "Enter an option: "
    selection = gets.chomp.upcase

    case selection
    when "1"
      puts `clear`
      puts "You selected Option 1"
    when "2"
      puts `clear`
      puts "You selected Option 2"
    when "3"
      puts `clear`
      puts "You selected Option 3"
    when "Q"
      valid_selection = true
      puts `clear`
      puts "Goodbye"
    else
      puts `clear`
      puts "You did not select a valid option"
    end # case

  end # while
end

menu()