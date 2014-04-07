module OrderProcessor

  def self.processOrder (customer, items)
    receipt = []
    receipt.push '=' * 80
    receipt.push "\nOrder Receipt"
    receipt.push '-------------'
    receipt.push "Customer name:                     #{customer.full_name}"
    receipt.push "Customer age:                      #{customer.age}"
    receipt.push "Customer's opening credit limit:  $#{'%.2f' % customer.available_credit}"


    receipt.push "\nItems Requested"
    receipt.push '---------------'
    items.each do |item|
      receipt.push customer.attempt_credit_purchase(item[:price], item[:description])
    end

    receipt.push "\nCustomer's closing credit limit is  $#{'%.2f' % customer.available_credit}"
    receipt.push "\nPurchase History"
    receipt.push '----------------'
    receipt.push customer.purchase_history
    receipt.push ""
    receipt.push '=' * 80

    receipt.join("\n")
  end

end
