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
  has_one :account, through: :financial
  has_one :group, through: :account
  has_one :user, through: :group

  # Private methods
  private

  def set_balance
    InstallmentsServices.new(self).call
  end
end
