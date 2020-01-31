# require "/bank_account.rb"
require "pry"

class Transfer

  attr_reader 
  attr_accessor :status, :sender, :receiver, :amount

  @@all = []

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    # binding.pry
    if self.sender.valid? && self.receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # binding.pry
    if self.valid? && self.sender.balance > @amount && self.status == "pending"
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end

  def reverse_transfer
    if @@all[-1].status == "complete"
      @@all[-1].sender.balance += @amount
      @@all[-1].receiver.balance -= @amount
      @@all[-1].status = "reversed"
    end
  end

end
