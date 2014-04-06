if check_module_defined :OrderProcessor
  describe OrderProcessor do

    describe "#OrderProcessor.processOrder" do
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
        expect(OrderProcessor.processOrder(@customer, @items)).to(be_a(String), "Should return a string")
      end
    end
  end
end

