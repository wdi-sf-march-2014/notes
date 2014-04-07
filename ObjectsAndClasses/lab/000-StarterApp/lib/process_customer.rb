
def processOrder (customer, items)
  receipt = []
  receipt.push '=' * 80
  receipt.push "\nOrder Receipt"
  receipt.push '-------------'
  receipt.push "Customer name:                     #{full_name(customer)}"
  receipt.push "Customer age:                      #{age(customer)}"
  receipt.push "Customer's opening credit limit:  $#{'%.2f' % available_credit(customer)}"


  receipt.push "\nItems Requested"
  receipt.push '---------------'
  items.each do |item|
    receipt.push attempt_credit_purchase(customer, item[:price], item[:description])
  end

  receipt.push "\nCustomer's closing credit limit is  $#{'%.2f' % available_credit(customer)}"
  receipt.push "\nPurchase History"
  receipt.push '----------------'
  receipt.push purchase_history customer
  receipt.push ""
  receipt.push '=' * 80

  receipt.join("\n")
end

