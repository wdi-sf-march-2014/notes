
def processCustomer (customer)
  puts "Customer's name is          #{full_name(customer)}"
  puts "Customer's age is           #{age(customer)}"
  puts "Customer's credit limit is  $#{'%.2f' % available_credit(customer)}"

  attempt_credit_purchase(customer, 300, "Milk Duds")

  puts "Customer's credit limit is  $#{'%.2f' % available_credit(customer)}"

  attempt_credit_purchase(customer, 800, "4K HD FlatScreen")

  puts "Customer's credit limit is  $#{'%.2f' % available_credit(customer)}"

  puts purchase_history customer
end

