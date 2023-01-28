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

  # Private methods
  private

  def set_balance
    InstallmentService.new(self).call
  end
end
