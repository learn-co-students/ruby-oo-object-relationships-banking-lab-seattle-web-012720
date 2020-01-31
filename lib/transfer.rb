require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :pending, :amount, :balance, :status

@@transaction = []
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @balance = sender.balance
    
  end

  def status
    
    @status
    # binding.pry
  end

  # def amount=(amount)
  #   @amount = amount
  # end
  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
     if @sender.balance > @amount && @sender.valid? && @receiver.valid? && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete" 
      @@transaction<< @amount

      @status

     else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
     end   
  end

  def reverse_transfer
    if @status == "complete"
    @sender.balance += @@transaction[-1]
    @receiver.balance -= @@transaction[-1]
    @status= "reversed"
    end
  end

end

# binding.pry