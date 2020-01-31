require 'pry'
require_relative 'bank_account'
class Transfer
  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  # can check that both accounts are valid
  # calls on sender and reveiver's method
  def valid?
    # binding.pry
    if @receiver.valid? && @sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.valid? && @receiver.valid? && !(@sender.balance - @amount < 0) && self.status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."  
    end
  end
  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed' 
    end
  end
end
