class ExampleAccount
  attr_accessor :balance
  attr_reader :owner
  def initialize( account_owner ) # ruby object constructor invoked on .new
    @owner = account_owner
    @balance = 0
  end
  def deposit( amount )
    @balance = @balance + amount
  end
  def withdraw( amount )
    @balance = @balance - amount
  end
end