require 'pry'

class Transfer

 
  @@past_transaction = [] 
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount=0) 
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@past_transaction << self 
  end 

  def valid? 
    me = @sender.valid?
    you = @receiver.valid?
    return me && you 
  end 

  def execute_transaction 
    #binding.pry
    #if @@past_transaction.include?(self) && self.valid? && @status == "pending"
    if @status == "pending" && self.valid? && @sender.valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else #@sender.balance < @amount || !@sender.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    #binding.pry
  end 

  def reverse_transfer
    if @status != "pending"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
