# frozen_string_literal: true

class Bank < ApplicationRecord
  # Validates
  validates :name, :number, presence: true, uniqueness: { case_sensitive: false }

  # Relationship
  has_many :accounts, dependent: :destroy
  has_many :integration_client_reporters, as: :reportable
end
