# frozen_string_literal: true

class Group < ApplicationRecord
  # Validates
  validates :name, :status, presence: true
  validates :name, uniqueness: { scope: :user, case_sensitive: false }

  # Enumerates
  enum status: %i[active inactive]

  # Relationships
  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :financials, through: :accounts

  def active?
    status == 'active'
  end
end
