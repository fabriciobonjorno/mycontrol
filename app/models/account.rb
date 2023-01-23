class Account < ApplicationRecord
  # Validates
  validates :agency, :account, :balance, :account_type, :status, presence: true
  validate :valid_balance, on: :update
  validate :account_number_type, on: :create

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

  # Public methods
  def convert_type
    case account_type
    when 'checking'
      'Checking'
    when 'saving'
      'Saving'
    end
  end

  def agency_with_account
    "#{agency}/#{account} - (#{convert_type})"
  end

  # Private methods
  private

  def valid_balance
    errors.add(:balance, 'não pode ser alterado, para atualizar o saldo faça um lançamento!.') if balance_changed?
  end

  def account_number_type
    number_type = Account.where(account: account, account_type: account_type)
    errors.add(:account, "já cadastrada para #{convert_type}") if number_type.exists?
  end
end
