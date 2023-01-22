# frozen_string_literal: true

class Installment < ApplicationRecord
  # Callbacks
  after_save :set_balance

  # Validates
  validates :name, :number, :due_date, :status, presence: true
  validates :payment_value, presence: true, numericality: { greater_than: 0 }
  validates :payment_date, presence: true, if: -> { status == 'paid' }

  # Enumerates
  enum status: %i[paid unpaid]

  # Relationships
  belongs_to :financial

  # Public methods
  def update_balance
    if status == 'paid' && financial.transaction_type == 'credit'
      balance = financial.account.balance + payment_value
    elsif status == 'paid' && financial.transaction_type == 'debit'
      balance = financial.account.balance - payment_value
    end
    balance
  end

  # Private methods
  private

  def set_balance
    account = financial.account
    account.update_columns(balance: update_balance) unless update_balance.nil?
  end
end
