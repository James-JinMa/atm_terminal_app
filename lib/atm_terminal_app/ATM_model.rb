# frozen_string_literal: true

class ATM_model
  def initialize(balance:0)
    @balance = balance
    #  balance = 0
  end

  def withdraw(withdraw:0)
    #  withdraw = 0
    @balance -= withdraw unless @balance < 0
  end

  def deposit(deposit:0)
    #  deposit = 0
    @balance += deposit
  end

  attr_reader :balance

  def password
    @password = '12345' # default password set to "12345"
  end
end
