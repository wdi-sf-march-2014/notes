
# 1) Add fullName and calculateGPA methods to your Student class
# a) fullName you can copy from the students_as_hashes.rb example
# b) for calculateGPA, you can get the basic code from students_as_hashes.rb
#    but you'll need to understand how I implemented addEnrollment to
#    complete the assignment


class Student
  attr_accessor :first_name, :last_name, :major, :date_of_birth

  def initialize(first,last,major,dob)
    @first_name = first
    @last_name = last
    @major = major
    @date_of_birth = dob
    @enrollments = []
  end

  #TODO: fullName HERE
  #TODO: calculateGPA HERE

  def addEnrollment(course, grade)
    @enrollments << Enrollment.new(course, grade)
  end

end

class Enrollment
  attr_accessor :course, :grade
  def initialize (course,grade)
    @course = course
    @grade = grade
  end
end

####################### DON'T EDIT BELOW THIS LINE! #############################

require_relative '../lib/test_helpers'

def runTests

  failures = []
  begin
    barry = Student.new 'Barry', 'White', 'Musicology', "1944-11-12"
    donna = Student.new 'Donna', 'Summer', 'Singing', "1948-12-31"
    skrillex = Student.new 'Skrillex', nil, 'Electronics', "1988-01-15"

    barry = Student.new 'Barry', 'White', 'Musicology', "1944-11-12"
    barry.addEnrollment 'Piano Accompaniment', 3.4
    barry.addEnrollment 'Piano Mathematics 101', 3.6
    barry.addEnrollment 'Operatic Voice 403', 4.0
    barry.addEnrollment 'Intro to Music', 4.0

    donna = Student.new 'Donna', 'Summer', 'Singing', "1948-12-31"
    donna.addEnrollment 'Your Voice as an Instrument', 4.0
    donna.addEnrollment 'Disco for beginners', 4.0
    donna.addEnrollment 'Intro to Music', 4.0

    skrillex = Student.new 'Skrillex', nil, 'Electronics', "1988-01-15"
    skrillex.addEnrollment 'Beginning Mixing', 4.0
    skrillex.addEnrollment 'basic soldering', 3.9
    skrillex.addEnrollment 'advanced arduino', 3.8
    skrillex.addEnrollment 'Intro to Music', 3.9

    # OUR EXPECTATIONS


    unless barry.respond_to? :fullName
      failures <<  "fullName isn't implemented, did you use def fullName"
    end

    unless barry.respond_to? :calculateGPA
      failures <<  "calculateGPA isn't implemented, did you use def calculateGPA"
    end

    unless barry.fullName == 'Barry White' && donna.fullName == 'Donna Summer' && skrillex.fullName.strip == 'Skrillex'
      failures << "fullName isn't working correctly"
    end

    unless float_equal(barry.calculateGPA, 3.75) && float_equal(donna.calculateGPA ,4.0) && float_equal(skrillex.calculateGPA,3.9)
      failures << "calculateGPA isn't working correctly"
    end

  rescue Exception => e
    failures << "An error occurred #{e.class} : #{e.message}\n#{e.backtrace.join("\n")}"
  end

  if failures.empty?
    printSuccess("You Student class meets all the expectations for this step")
  else
    failures.each { |message| printError(message)}
  end
end


runTests
