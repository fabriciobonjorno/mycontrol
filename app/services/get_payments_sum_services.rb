# frozen_string_literal: true

class GetPaymentsSumServices
  def initialize(user_id, transaction_type, installment_status)
    @user_id = user_id
    @transaction_type = transaction_type
    @installment_status = installment_status
  end

  def call
    find_payments
  end

  private

  def find_payments
    @transaction_type = {
      revenue: 0,
      expense: 1
    }[@transaction_type]

    @installment_status = {
      paid: 0,
      unpaid: 1
    }[@installment_status]

    User.joins(groups: [accounts: [financials: :installments]])
        .where(id: @user_id)
        .where("#{Financial.table_name}.transaction_type = ? ", @transaction_type)
        .where("#{Installment.table_name}.status = ? ", @installment_status)
        .where("#{Installment.table_name}.due_date > ? AND #{Installment.table_name}.due_date < ? ", Time.now.beginning_of_month, Time.now.end_of_month)
        .pluck("sum(#{Installment.table_name}.payment_value)").sum
  end
end
