require './square'
require 'spec_helper'

# rspec --seed 10500 spec/square_spec.rb 

describe Square do  


  it "should have a side" do
    my_square = Square.new(5)
    # my_square.side.should eq(5)
    expect(my_square.side).to eq(5)
  end

#  it "should be able to change side length" do 

#  it "should calculate the area" do

#  it "should calculate the perimeter" do

#  it "should have a to_s method" do 

end