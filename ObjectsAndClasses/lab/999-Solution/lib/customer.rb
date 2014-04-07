class Customer
  attr_reader :first_name, :last_name, :available_credit, :date_of_birth
  attr_reader :purchases

  def initialize first_name, last_name, date_of_birth, available_credit
    @first_name = first_name
    @last_name = last_name
    @available_credit = available_credit
    @date_of_birth = date_of_birth
    @purchases = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    Time.now.year - @date_of_birth.year
  end

  def use_credit(amount)
    if @available_credit >= amount
      @available_credit-=amount
      true
    else
      false
    end
  end

  def attempt_credit_purchase (amount, description)
    if use_credit amount

      # TODO: Ooops I forgot to store the item description in an array for the customer!
      # You'll need to initialize the purchases array in the initialize method or
      # check it here, how will I do this once Customer is a Class?
      @purchases.push description

      "APPROVED: $#{'%.2f' % amount} #{description}"
    else
      "DECLINED: $#{'%.2f' % amount} #{description} Purchase! Only $#{'%.2f' % available_credit} credit available"
    end
  end

  def purchase_history
    return @purchases.join "\n"
  end
end
