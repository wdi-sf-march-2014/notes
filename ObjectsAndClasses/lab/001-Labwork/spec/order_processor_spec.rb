require 'spec_helper'

if check_module_defined :OrderProcessor
  describe OrderProcessor do

    describe "#OrderProcessor.processOrder" do
      context "with affluent customer" do

        before :each do
          @affluentCustomer = double('affluent customer')
          @affluentCustomer.stub!(:full_name).and_return("William Tell")
          @affluentCustomer.stub!(:age).and_return(102)
          @affluentCustomer.stub!(:available_credit).and_return(999999)
          @affluentCustomer.stub!(:use_credit).and_return(true)
          @affluentCustomer.stub!(:attempt_credit_purchase).and_return("ACCEPTED")
          @affluentCustomer.stub!(:purchase_history).and_return(["Fake", "Purchase", "History"])
        end
        before :all do
          @affordableitems = [
              {
                  price: 3,
                  description: 'Milk Duds'
              },
              {
                  price: 1,
                  description: 'Snickers Bar'
              }
          ]
          @expensiveItems =[
              {
                  price: 3000,
                  description: '4K HD FlatScreen'
              },
              {
                  price: 300000,
                  description: 'MotorYacht'
              },
          ]
        end

        it { OrderProcessor.should respond_to :processOrder }
        it { OrderProcessor.should_not respond_to :new }
        it "should take 2 parameters, customer and items array" do
          expect(OrderProcessor.processOrder(@affluentCustomer, @expensiveItems)).to(be_a(String), "Should return a receipt string")
        end
        
        it "should process all the items in the array for the customer" do
          @affluentCustomer.should_receive(:full_name)
          @affluentCustomer.should_receive(:age)
          @affluentCustomer.should_receive(:attempt_credit_purchase).with(@affordableitems[0][:price], @affordableitems[0][:description]).ordered
          @affluentCustomer.should_receive(:attempt_credit_purchase).with(@affordableitems[1][:price], @affordableitems[1][:description]).ordered
          OrderProcessor.processOrder(@affluentCustomer, @affordableitems)
        end

        describe "should return a receipt" do
          before :all do
            @receipt = OrderProcessor.processOrder(@affluentCustomer, @affordableitems)
          end
          it "should include customer name" do
            expect(@receipt).to include("William Tell")
          end
          it "should include purchase history" do
            expect(@receipt).to include("Fake\nPurchase\nHistory")
          end
          it "should include 'Order Receipt'" do
            expect(@receipt).to include("Order Receipt")
          end
          it "should include attempt responses" do
            expect(@receipt).to include("ACCEPTED\nACCEPTED")
          end
          it "should include closing credit limit" do
            expect(@receipt).to include("Customer's closing credit limit is  $999999.00")
          end
        end
      end
    end
  end
end

