# frozen_string_literal: true

class Financial < ApplicationRecord
  # Validates
  validates :transaction_type, :installments, presence: true
  before_save :set_total

  # Enumerates
  enum transaction_type: %i[credit debit]

  # Relationships
  belongs_to :account
  has_one :group, through: :account
  has_many :installments, dependent: :destroy
  accepts_nested_attributes_for :installments, reject_if: proc { |l|
                                                            l[:name].blank? ||
                                                              l[:payment_value].blank?
                                                          }, allow_destroy: true

  def total
    installments.collect { |installment| installment.payment_value }.sum
  end

  def set_total
    self[:total_transaction] = total
  end
end
