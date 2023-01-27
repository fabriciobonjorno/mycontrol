# frozen_string_literal: true

class Bank < ApplicationRecord
  # Validates
  validates :name, :number, presence: true
  validates :name, :number, uniqueness: { case_sensitive: false, scope: :user }

  # Enumerates
  enum status: %i[active inactive]

  # Relationship
  belongs_to :user
  has_many :accounts, dependent: :destroy
  has_many :integration_client_reporters, as: :reportable

  def active?
    status == 'active'
  end
end
