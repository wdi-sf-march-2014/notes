require 'spec_helper'


if check_class_defined(:Customer)
  describe Customer do
    it "should be a class" do
      expect(Customer).to respond_to(:new)
    end

    it "should have an initialize method with 4 arguments" do
      expect(Customer.new).to respond_to(:initialize).with(4).arguments
    end
    it "should have full_name" do
      expect(Customer.new).to respond_to(:full_name).with(0).arguments
    end
    it "should have age" do
      expect(Customer.new).to respond_to(:age).with(0).arguments
    end
    it "should have available_credit" do
      expect(Customer.new).to respond_to(:available_credit).with(0).arguments
    end
    it "should have use_credit" do
      expect(Customer.new).to respond_to(:use_credit).with(1).arguments
    end
    it "should have attempt_credit_purchase" do
      expect(Customer.new).to respond_to(:attempt_credit_purchase).with(2).arguments
    end
    it "should have purchase_history" do
      expect(Customer.new).to respond_to(:purchase_history).with(0).arguments
    end

    describe "Should copy the methods in the lib/customer_hash.rb StarterApp file" do
      before :all do
        @birthyear = 1982
        @customer = Customer.new('Bob', 'Smith', Date.new(@birthyear, 9, 2), 2000)
        @ageToCheck = Time.now.year - @birthyear
      end
      it "should have a first_name of Bob" do
        @customer.first_name.should eq 'Bob'
      end
      it "should have a last_name of Smith" do
        @customer.last_name.should eq 'Smith'
      end
      it "should have available_credit of 2000" do
        @customer.available_credit.should eq 2000
      end
      it "should have age of of #{@ageToCheck}" do
        @customer.age.should eq @ageToCheck
      end
    end

    describe "#use_credit (should take one parameter)" do
      before :each do
        @customer = Customer.new('Molly', 'Jones', Date.new(1992, 9, 2), 1500)
      end
      it "should decrement the available_credit if available" do
        @customer.use_credit 100
        @customer.available_credit.should eq 1400
      end
      it "should return true if credit was available" do
        @customer.use_credit 300.should eq true
      end
      it "should NOT decrement the available_credit if available" do
        @customer.use_credit 2000
        @customer.available_credit.should eq 1500
      end
      it "should return false if insufficient credit available" do
        (@customer.use_credit 1501).should eq false
      end
    end

    describe "#attempt_credit_purchase (should take two parameters)" do
      before :each do
        @customer = Customer.new('Sally', 'Johnson', Date.new(1987, 11, 3), 600)
      end
      it "should return true if credit was available" do
        (@customer.attempt_credit_purchase 123, "Bookcase").should eq true
      end
      it "should return false if credit was not available" do
        (@customer.attempt_credit_purchase 601, "iPhone").should eq false
      end
      it "should add description to the purchase history if credit was available" do
        @customer.attempt_credit_purchase 599, "Necklace"
        @customer.purchase_history.should array_include "Necklace"
      end
      it "should not add description to the purchase history if credit was not available" do
        history = @customer.purchase_history
        @customer.attempt_credit_purchase 10000, "Ford Focus"
        @customer.purchase_history.should eq history
      end
    end

    describe "#purchase_history (should take no parameters)" do
      before :each do
        @customer = Customer.new('Bob', 'Holly', Date.new(1965, 1, 1), 6000)
      end
      it "should return an empty array for new customers" do
        @customer.purchase_history.should eq []
      end
      it "should return an array with one element after 1 purchase" do
        @customer.attempt_credit_purchase 3, "Birthday Card"
        @customer.purchase_history.should eq ["Birthday Card"]
      end
      it "should return an array with two elements after 2 purchases" do
        @customer.attempt_credit_purchase 4, "Valentine Card"
        @customer.attempt_credit_purchase 4, "Valentine Card"
        @customer.purchase_history.should eq ["Valentine Card", "Valentine Card"]
      end
    end
  end
end