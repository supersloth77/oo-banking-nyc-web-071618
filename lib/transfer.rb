require 'pry'

class Transfer

  attr_accessor :transfer, :sender, :receiver, :status

def initialize(sender, receiver, transfer)
  @transfer = transfer
  @receiver = receiver
  @sender = sender
  @status = "pending"

end

def amount
  @transfer
end

def valid?
  if sender.valid? && receiver.valid? == true
    return true
  else
    false
  end
end

def execute_transaction
  if @status == "pending" && sender.valid? && @sender.balance >= transfer
    @sender.balance -= transfer
    @receiver.balance += transfer
    @status = "complete"
    #binding.pry
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
end

def reverse_transfer
  if @status == "complete"
    @sender.balance += transfer
    @receiver.balance -= transfer
    @status = "reversed"
  end
end

end
