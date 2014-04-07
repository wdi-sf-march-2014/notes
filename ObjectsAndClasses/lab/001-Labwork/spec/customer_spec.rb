require 'spec_helper'

check_class_defined(:Customer)

describe  "should be a class and have an initialize method with 4 arguments (first_name, last_name, date_of_birth, available_credit)", labStep: "Customer Basics" do
  it "and should be a class" do
    expect(Customer).to respond_to(:new)
  end
  it "and should have an initialize method with 4 arguments" do
    expect(Customer.new('Jill', 'Smith', Date.new(1923, 1, 1), 0)).to be_a(Customer)
  end
end

describe "should use attr_reader for instance variables, storing the values passed into initialize", labStep: "Customer Data" do
  let(:emptyCustomer)  do
    Customer.new('Mary', 'Jones', Date.new(1987, 1, 1), 0)
  end
  it "and should use attr_reader: date_of_birth" do
    expect(emptyCustomer).to respond_to(:date_of_birth).with(0).arguments
  end
  it "and should use attr_reader: available_credit" do
    expect(emptyCustomer).to respond_to(:available_credit).with(0).arguments
  end
  it "and should use attr_reader: first_name" do
    expect(emptyCustomer).to respond_to(:first_name).with(0).arguments
  end
  it "and should use attr_reader: last_name" do
    expect(emptyCustomer).to respond_to(:last_name).with(0).arguments
  end
end

describe "should re-implement the methods in the lib/customer_hash.rb StarterApp file ", labStep: "Customer Methods" do
  let(:emptyCustomer)  do
    Customer.new('Mary', 'Jones', Date.new(1987, 1, 1), 0)
  end
  it "and should have 'full_name' method defined with no arguments" do
    expect(emptyCustomer).to respond_to(:full_name).with(0).arguments
  end
  it "and should have 'age' method defined with no arguments" do
    expect(emptyCustomer).to respond_to(:age).with(0).arguments
  end
end

describe "Should copy the methods in the lib/customer_hash.rb StarterApp file", labStep: "Customer Method Implementations"  do

  let(:birthyear){ 1982 }
  let(:bday){ Date.new(birthyear, 9, 2) }
  let(:customer){ Customer.new('Bob', 'Smith',bday, 2000) }
  let(:ageToCheck){ Time.now.year - birthyear }

  it "and store the first_name passed to initialize in @first_name amd use attr_reader :first_name" do
    customer.first_name.should eq 'Bob'
  end
  it "and store the last_name passed to initialize in @last_name amd use attr_reader :last_name" do
    customer.last_name.should eq 'Smith'
  end
  it "and store the available_credit passed to initialize in @available_credit amd use attr_reader :available_credit" do
    customer.available_credit.should eq 2000
  end
  it "and store the date_of_birth passed to initialize in @date_of_birth amd use attr_reader :date_of_birth" do
    customer.date_of_birth.should eq bday
  end
  it "and should have a calculated age (Time.now.year - birthyear)" do
    customer.age.should eq ageToCheck
  end
  it "and should have a full_name of Bob Smith" do
    customer.full_name.should eq 'Bob Smith'
  end
end

describe "#use_credit", labStep: "Customer Credit Processing" do
  let(:customer) { Customer.new('Molly', 'Jones', Date.new(1992, 9, 2), 1500) }

  it "should have 'use_credit' method with 1 parameter: (amount)" do
    expect(customer).to respond_to(:use_credit).with(1).arguments
  end

  it "should decrement the available_credit if available (@available_credit-=amount)" do
    customer.use_credit 100
    customer.available_credit.should eq 1400
  end
  it "should return true if credit was available" do
    customer.use_credit(300).should eq true
  end
  it "should NOT decrement the available_credit if the amount is > available_credit" do
    customer.use_credit 2000
    customer.available_credit.should eq 1500
  end
  it "should return false if insufficient credit available" do
    customer.use_credit(1501).should eq false
  end
end

describe "#attempt_credit_purchase", labStep: "Customer Purchases" do
  let!(:customer){ Customer.new('Sally', 'Johnson', Date.new(1987, 11, 3), 600) }
  it "should have 'attempt_credit_purchase' method with 2 arguments: (amount, description)" do
    expect(customer).to respond_to(:attempt_credit_purchase).with(2).arguments
  end
  it "should use the use_credit method to see if the credit was available" do
    expect(customer).to receive(:use_credit).with(5).and_return(true)
    customer.attempt_credit_purchase 5, "Book"
  end
  it "should return 'APPROVED: $123.00 Bookcase' if credit was available" do
    (customer.attempt_credit_purchase 123, "Bookcase").should eq "APPROVED: $123.00 Bookcase"
  end
  it "should return false if credit was not available" do
    (customer.attempt_credit_purchase 601, "iPhone").should eq "DECLINED: $601.00 iPhone Purchase! Only $600.00 credit available"
  end
end

describe "#purchases", labStep: "Store Purchase History" do
  let!(:customer) { Customer.new('Bob', 'Holly', Date.new(1965, 1, 1), 6000) }

  it "should be defined with attr_reader :purchases" do
    expect(customer).to respond_to(:purchase_history).with(0).arguments
  end
  it "and should return an empty array for new customers, set @purchases in #initialize" do
    customer.purchases.should eq []
  end
end

describe "#attempt_credit_purchase", labStep: "Customer Purchase History" do
  let!(:customer) { Customer.new('Sally', 'Sampson', Date.new(1972, 3, 12), 5000) }

  it "and should return an array with one element after 1 purchase" do
    customer.attempt_credit_purchase 3, "Birthday Card"
    customer.purchases.should eq ["Birthday Card"]
  end
  it "and should return an array with two elements after 2 purchases" do
    customer.attempt_credit_purchase 4, "Valentine Card"
    customer.attempt_credit_purchase 4, "Valentine Card"
    customer.purchases.should eq ["Valentine Card", "Valentine Card"]
  end

  it "should add description to the purchase history if credit was available" do
    customer.attempt_credit_purchase 599, "Necklace"
    customer.purchases.should include "Necklace"
  end
  it "should not add description to the purchase history if credit was not available" do
    history = customer.purchases
    customer.attempt_credit_purchase 10000, "Ford Focus"
    customer.purchases.should eq history
  end
end

describe "#purchase_history", labStep: "Generate Purchase History" do
  let!(:customer) { Customer.new('Wally', 'Giffen', Date.new(1980, 5, 1), 100) }

  it "and should return an array with one element after 1 purchase" do
    customer.attempt_credit_purchase 3, "Birthday Card"
    customer.purchase_history.should eq "Birthday Card"
  end
  it "and should return an array with two elements after 2 purchases" do
    customer.attempt_credit_purchase 4, "Valentine Card"
    customer.attempt_credit_purchase 4, "Holiday Card"
    customer.purchase_history.should eq "Valentine Card\nHoliday Card"
  end

  it "should not add description to the purchase history if credit was not available" do
    history = customer.purchase_history
    customer.attempt_credit_purchase 10000, "Ford Focus"
    customer.purchase_history.should eq history
  end
end

