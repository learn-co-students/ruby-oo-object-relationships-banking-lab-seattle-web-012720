class BankAccount
    attr_reader :name
    attr_accessor :balance, :status, :deposit
    
    def initialize(name)
        @name= name
        @balance = 1000
        @status = 'open'
    end

    def deposit(money)
        @balance += money
    end

    def display_balance
        p "Your balance is $#{balance}."
    end

    def valid?
        if @status == 'open' && @balance > 0
            return true
        else
            return false
        end
    end

    def close_account
        @status = 'closed'
        @status
    end
end
