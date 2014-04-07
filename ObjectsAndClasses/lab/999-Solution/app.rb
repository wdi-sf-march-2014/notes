require 'date'
require_relative 'lib/customer.rb'
require_relative 'lib/orderprocessor.rb'

customer = Customer.new('Donald', 'Sumlington', Date.parse('1970-02-14'), 500.00)

items = [
    { price: 800, description: '4K HD FlatScreen'},
    { price: 3, description: 'Milk Duds'},
    { price: 5, description: 'Popcorn'},
    { price: 22, description: 'Movie Tickets'}
]


#Get the Receipt
receipt = OrderProcessor.processOrder customer, items

#Print it out!
puts receipt
