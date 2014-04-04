require 'spec_helper'

describe "Customer class should exist" do
  it "should be in lib/customer.rb" do
    check_class_defined(:Customer).should eq true
  end
end

if check_class_defined :Customer
  describe Customer do
    describe "#new should take 4 parameters, first, last, dob and credit" do
      before :all do
        @birthyear = 1982
        @customer = Customer.new('Bob','Smith',Date.new(birthyear,9,2),2000)
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
        @customer = Customer.new('Molly','Jones',Date.new(1992,9,2),1500)
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

    end

    describe "#purchase_history (should take no parameters)" do

    end

  end
end



def use_credit(customer, amount)
  if customer[:credit_limit] >= amount
    customer[:credit_limit]-=amount
    true
  else
    false
  end
end

def attempt_credit_purchase (customer, amount, description)
  if use_credit customer, amount
    puts "$#{'%.2f' % amount} Purchase of #{description} Approved!"
    if customer['purchases']
      customer['purchases'].push description
    else
      customer['purchases'] = [description]
    end
  else
    puts "DECLINED: #{description} Purchase! Only $#{'%.2f' % available_credit(customer)} credit available"
  end
end

def purchase_history(customer)
  "Sorry print_purchase_history not implemented yet!"
end

