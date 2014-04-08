def allStudents
  [
      {
          first_name: 'Barry',
          last_name: 'White',
          major: 'Musicology',
          date_of_birth: "1944-11-12",
          grades: [3.4, 3.6, 4.0, 4.0],
          courses: [
              'Piano Accompaniment ', 'Mathematics 101',
              'Operatic Voice 403', 'Intro to Music'
          ]
      },
      {
          first_name: 'Donna',
          last_name: 'Summer',
          major: 'Singing',
          date_of_birth: "1948-12-31",
          grades: [4.0, 4.0, 4.0],
          courses: [
              'Your Voice as an Instrument', 'Disco for beginners',
              'Intro to Music'
          ]
      },
      {
          first_name: 'Skrillex',
          last_name: '',
          major: 'Electronics',
          date_of_birth: "1988-01-15",
          grades: [4.0, 3.9, 3.8, 3.9],
          courses: [
              'Beginning Mixing', 'basic soldering',
              'advanced arduino', 'Intro to Music'
          ]
      }
  ]
end

def fullName student
  "#{student[:first_name]} #{student[:last_name]}"
end

def calculateGPA student
  if student[:grades] && !student[:grades].empty?
    student[:grades].inject(0.0){
        |sum,grade| sum + grade
    } / student[:grades].length.to_f
  else
    0.to_f
  end
end


puts "#{fullName allStudents[0]} : #{calculateGPA allStudents[0]}"
puts "#{fullName allStudents[1]} : #{calculateGPA allStudents[1]}"
puts "#{fullName allStudents[2]} : #{calculateGPA allStudents[2]}"
