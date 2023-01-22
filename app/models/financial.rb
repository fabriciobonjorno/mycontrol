class Financial < ApplicationRecord
  # Validates
  validates :transaction_type, presence: true

  # Enumerates
  enum transaction_type: %i[credit debit]

  # Relationships
  belongs_to :account
end
