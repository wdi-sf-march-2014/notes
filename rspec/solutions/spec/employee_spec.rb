require './employee'
require 'spec_helper'

describe Employee do

  before(:each) do
    @employee = Employee.new("Mickey", "Mouse", "Cartoon Character", Date.parse('1928-11-18'), 1)
  end

  it "has an name" do
    @employee.first_name.should eq("Mickey")
  end

  it "can change names" do
    @employee.first_name = "Donald"
    @employee.first_name.should eq("Donald")
  end

  it "has a job title" do 
    @employee.title.should eq("Cartoon Character")
  end

  it "has an employee number" do  
    @employee.employee_number.should eq(1)
  end

  it "has a full name" do
    @employee.full_name.should == "Mickey Mouse"
  end

  it "has an age" do
    @employee.age.should eq(Date.today.year - Date.parse('1928-11-18').year)
  end

  it "has an introduce_yourself method" do 
    @employee.introduce_yourself.should eq("Hi, my name is Mickey Mouse. I am employee number 1.")
  end

end

