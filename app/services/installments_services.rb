# frozen_string_literal: true

class InstallmentsServices
  def initialize(installment)
    @installment = installment
  end

  def call
    set_balance
  end

  private

  def update_balance
    if @installment.status == 'paid' && @installment.financial.transaction_type == 'credit'
      balance = @installment.financial.account.balance + @installment.payment_value
    elsif @installment.status == 'paid' && @installment.financial.transaction_type == 'debit'
      balance = @installment.financial.account.balance - @installment.payment_value
    end
    balance
  end

  def set_balance
    account = @installment.financial.account
    account.update_columns(balance: update_balance) unless update_balance.nil?
  end
end
