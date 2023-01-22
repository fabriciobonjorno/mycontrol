class Account < ApplicationRecord
  # Validates
  validates :agency, :account, :balance, :account_type, :status, presence: true

  # enums
  enum account_type: %i[checking saving]
  enum status: %i[active inactive]
  belongs_to :bank
  belongs_to :group
  has_one :user, through: :group
end
