require './square'
require 'spec_helper'

describe Square do  

  before(:each) do  
    @my_square = Square.new(5)
  end

  it "should have side set to 5" do
    # @my_square.side.should eq(5)
    expect(@my_square.side).to eq(5)
  end

  it "should not have side set to 6" do
    # @my_square.side.should_not eq(6)
    expect(@my_square.side).not_to eq(6)
  end

  it "should be able to change side length" do 
    @my_square.side = 6
    @my_square.side.should eq(6)
  end

  it "should calculate the area" do
    @my_square.area.should eq(25)
  end

  it "should calculate the perimeter" do
    @my_square.perimeter.should eq(20)
  end

  it "should have a to_s method" do 
    # @my_square.to_s.should eq("I am a square. My sides are of length: 5. My area is: 25.")
    expect(@my_square.to_s).to match("I am a square. My sides are of length: 5. My area is: 25.")
  end

end