class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    elsif sender.valid? && receiver.valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

end
