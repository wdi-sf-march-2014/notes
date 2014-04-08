
# 1) Define the Students class here
# Just code for the attributes passed into the constructor
# at this time using attr_accessor
# class Student ...

# 2) Add 'stub' instance methods for fullName, calculateGPA and addEnrollment(course, grade)
# 'stub' methods don't actually do anything they are just empty
# e.g:
#
# def foo (x,y)
# end


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
