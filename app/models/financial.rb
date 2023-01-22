# frozen_string_literal: true

class Financial < ApplicationRecord
  # Validates
  validates :transaction_type, :installments, presence: true

  # Enumerates
  enum transaction_type: %i[credit debit]

  # Relationships
  belongs_to :account
  has_one :group, through: :account
  has_many :installments, dependent: :destroy
  accepts_nested_attributes_for :installments, reject_if: :all_blank, allow_destroy: true
end
