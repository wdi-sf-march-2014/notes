
# 1) Define the Students class
# class Student ...
# a) Just code for the attributes passed into the constructor
# b) use attr_accessor
# c) store them instance variables:  @first_name, @last_name, @major, @date_of_birth


# TODO: Your work goes here!


####################### DON'T EDIT BELOW THIS LINE! #############################


require_relative '../lib/test_helpers'

def runTests

  failures = []


  if !Object.const_defined?(:Student)
    failures << "Student class isn't implemented"
  else
    begin
      test1 = Student.new 'Test', 'Test', 'Test', "1900-01-01"
    rescue ArgumentError => e
      failures << "initialize should take 4 parameters: #{e.message}"
    end

    begin
      barry = Student.new 'Barry', 'White', 'Musicology', "1944-11-12"
      donna = Student.new 'Donna', 'Summer', 'Singing', "1948-12-31"
      skrillex = Student.new 'Skrillex', nil, 'Electronics', "1988-01-15"


      # OUR EXPECTATIONS

      unless barry.instance_of? Student
        failures <<  "Student.new isn't working correctly"
      end

      unless barry.respond_to? :first_name
        failures <<  "first_name isn't implemented, did you use attr_accessor :first_name?"
      end

      unless barry.first_name == 'Barry' && donna.first_name == 'Donna' && skrillex.first_name == 'Skrillex'
        failures << "first_name isn't working correctly, did you set @first_name in the constructor?"
      end

      unless barry.respond_to? :last_name
        failures <<  "last_name isn't implemented, did you use attr_accessor :last_name?"
      end

      unless barry.last_name == 'White' && donna.last_name == 'Summer' && skrillex.last_name.nil?
        failures << "last_name isn't working correctly, did you set @last_name in the constructor?"
      end

      unless barry.respond_to? :major
        failures <<  "major isn't implemented, did you use attr_accessor :major?"
      end

      unless barry.major == 'Musicology' && donna.major == 'Singing' && skrillex.major == 'Electronics'
        failures << "major isn't working correctly, did you set @major in the constructor?"
      end

      unless barry.respond_to? :date_of_birth
        failures <<  "date_of_birth isn't implemented, did you use attr_accessor :date_of_birth?"
      end

      unless barry.date_of_birth == "1944-11-12" && donna.date_of_birth == "1948-12-31" && skrillex.date_of_birth == "1988-01-15"
        failures << "date_of_birth isn't working correctly, did you set @date_of_birth in the constructor?"
      end

    rescue Exception => e
      failures << "An error occurred #{e.class} : #{e.message}\n#{e.backtrace.join("\n")}"
    end

   end

  if failures.empty?
    printSuccess("You Student class meets all the expectations for this step")
  else
    failures.each { |message| printError(message)}
  end
end


runTests
