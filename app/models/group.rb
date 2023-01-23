# frozen_string_literal: true

class Group < ApplicationRecord
  # Validates
  validates :name, :status, presence: true

  # Enumerates
  enum status: %i[active inactive]

  # Relationships
  belongs_to :user
  has_many :accounts, dependent: :destroy

  def active?
    status == 'active'
  end
end
