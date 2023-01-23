class Account < ApplicationRecord
  # Validates
  validates :agency, :account, :balance, :account_type, :status, presence: true

  # enums
  enum account_type: %i[checking saving]
  enum status: %i[active inactive]

  # Relationships
  belongs_to :bank
  belongs_to :group
  has_one :user, through: :group
  has_many :financials, dependent: :destroy

  def active?
    status == 'active'
  end
end
