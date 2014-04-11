require './employee'
require 'spec_helper'

describe Employee do


  it "has an name" do
    @employee = Employee.new("Mickey", "Mouse")
    @employee.first_name.should eq("Mickey")
  end


end

