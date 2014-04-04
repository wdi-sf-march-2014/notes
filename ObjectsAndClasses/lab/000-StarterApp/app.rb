require_relative 'lib/customer_hash'
require_relative 'lib/process_customer'

customer = {
    first_name: 'Donald',
    last_name: 'Sumlington',
    date_of_birth: Date.new(1970,2,14),
    credit_limit:  900.00
}

processCustomer customer

