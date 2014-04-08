def allStudents
  [
      {
          first_name: 'Barry',
          last_name: 'White',
          major: 'Musicology',
          date_of_birth: "1944-11-12",
          enrollments: [
              { course: 'Piano Accompaniment', grade: 3.4 },
              { course: 'Mathematics 101', grade: 3.6 },
              { course: 'Operatic Voice 403', grade: 4.0 },
              { course: 'Intro to Music', grade: 4.0 }
          ]
      },
      {
          first_name: 'Donna',
          last_name: 'Summer',
          major: 'Singing',
          date_of_birth: "1948-12-31",
          enrollments: [
              { course: 'Your Voice as an Instrument', grade: 4.0 },
              { course: 'Disco for beginners', grade: 4.0 },
              { course: 'Intro to Music', grade: 4.0 }
          ]
      },
      {
          first_name: 'Skrillex',
          last_name: '',
          major: 'Electronics',
          date_of_birth: "1988-01-15",
          enrollments: [
              { course: 'Beginning Mixing', grade: 4.0 },
              { course: 'Basic Soldering', grade: 3.9 },
              { course: 'Advanced Arduino', grade: 3.8 },
              { course: 'Intro to Music', grade: 3.9 }
          ]
      }
  ]
end

def fullName student
  "#{student[:first_name]} #{student[:last_name]}"
end

def calculateGPA student
  if student[:enrollments] && !student[:enrollments].empty?
    student[:enrollments].inject(0.0){
        |sum,enrollment| sum + enrollment[:grade]
    } / student[:enrollments].length.to_f
  else
    0.to_f
  end
end


def printStudentSummary
  puts "#{fullName allStudents[0]} : #{calculateGPA allStudents[0]}"
  puts "#{fullName allStudents[1]} : #{calculateGPA allStudents[1]}"
  puts "#{fullName allStudents[2]} : #{calculateGPA allStudents[2]}"
end


printStudentSummary