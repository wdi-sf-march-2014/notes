
def processOrder (customer, items)
  receipt = []
  receipt.push 'Order Receipt'
  receipt.push '-------------'
  receipt.push "Customer's name is          #{full_name(customer)}"
  receipt.push "Customer's age is           #{age(customer)}"
  receipt.push "Customer's credit limit is  $#{'%.2f' % available_credit(customer)}"

  items.each do |item|
    receipt.push attempt_credit_purchase(customer, item[:price], item[:description])
    receipt.push "Customer's credit limit is  $#{'%.2f' % available_credit(customer)}"
  end

  receipt.push ""
  receipt.push 'Purchase History'
  receipt.push '----------------'
  receipt.push purchase_history customer

  receipt.join("\n")
end

