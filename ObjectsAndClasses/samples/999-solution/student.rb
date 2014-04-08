require 'date'

class Enrollment
  attr_accessor :course, :grade
  def initialize (course,grade)
    @course = course
    @grade = grade
  end
end

class Student
  attr_accessor :first_name, :last_name, :major, :date_of_birth
  attr_reader :enrollments

  def initialize (first,last,major,dob)
    @enrollments = []
    @first_name = first
    @last_name = last
    @major = major
    @date_of_birth = Date.parse dob
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
end

def allStudents

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

  [barry, donna, skrillex]
end

allStudents.each { |student| puts "#{student.fullName} : #{student.calculateGPA}" }
