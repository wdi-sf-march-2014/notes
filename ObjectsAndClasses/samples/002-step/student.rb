
# 1) Add fullName and calculateGPA methods to your Student class
# a) fullName you can copy from the students_as_hashes.rb example
# b) for calculateGPA, you can get the basic code from students_as_hashes.rb
#    but you'll need to understand how I implemented addEnrollment to
#    complete the assignment


class Student
  attr_accessor :first_name, :last_name, :major, :date_of_birth

  # TODO: Create a class variable here and set it to zero

  def initialize(first,last,major,dob)
    @first_name = first
    @last_name = last
    @major = major
    @date_of_birth = dob
    @enrollments = []
    ## Increment the class variable
  end

  def calculateGPA
    @enrollments.inject(0.0){
        |sum, enrollment| sum + enrollment.grade
    } / @enrollments.length.to_f
  end

  def fullName
    "#{@first_name} #{@last_name}"
  end

  def addEnrollment(course, grade)
    @enrollments << Enrollment.new(course, grade)
  end

  #TODO: define a class method studentCount


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

    unless Student.respond_to? :studentCount
      failures <<  "Student.studentCount isn't implemented, did you use def self.studentCount"
    end

    unless Student.studentCount == 3
      failures <<  "Student.studentCount isn't implemented correctly, did you use @@studentCount and increment it?"
    end

  rescue Exception => e
    failures << "An error occurred #{e.class} : #{e.message}\n#{e.backtrace.join("\n")}"
  end

  if failures.empty?
    printCompleteSuccess("You've completed the workshop!\nNow compare your code to the sample solution in 999-solution")
  else
    failures.each { |message| printError(message)}
  end
end


runTests
