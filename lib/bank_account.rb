class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def initialize(name, balance = 1000)
        @name = name
        @balance = balance
        @status = "open"
        @@all << self
    end

    def deposit(money)
        @balance += money
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            true
        else
            false
        end
    end

    def close_account
        @status = "closed"
    end

    def self.all
        @@all
    end

end
