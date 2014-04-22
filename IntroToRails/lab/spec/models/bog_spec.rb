require 'spec_helper'

describe Bog do
  describe "attributes" do
    before :each do
      @bog = Bog.new
    end
    
    it "should have a name" do
      expect(@bog).to respond_to(:name)
    end

    it "should have a description" do
      expect(@bog).to respond_to(:description)
    end
  end
end