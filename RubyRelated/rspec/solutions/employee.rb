require 'Date'

class Employee
  attr_accessor :first_name, :last_name, :title, :date_of_birth, :employee_number

  def initialize(first, last, title, dob, employee_number)
    @first_name = first
    @last_name = last
    @title = title
    @date_of_birth = dob
    @employee_number = employee_number
    end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def age
    Time.now.year - @date_of_birth.year
  end

  def introduce_yourself
    "Hi, my name is #{full_name}. I am employee number #{@employee_number}."
  end

end

