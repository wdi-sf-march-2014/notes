require 'date'

def full_name(customer)
  "#{customer[:first_name]} #{customer[:last_name]}"
end

def age(customer)
  "#{Time.now.year - customer[:date_of_birth].year}"
end

def available_credit(customer)
  customer[:credit_limit]
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
    true
  else
    puts "DECLINED: #{description} Purchase! Only $#{'%.2f' % available_credit(customer)} credit available"
    false
  end
end

def purchase_history(customer)
   "Sorry print_purchase_history not implemented yet!"
end

