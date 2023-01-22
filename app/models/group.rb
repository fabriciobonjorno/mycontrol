# frozen_string_literal: true

class Group < ApplicationRecord
  # Validates
  validates :name, :status, presence: true

  # Enumerates
  enum status: %i[active inactive]

  # Relationships
  belongs_to :user
end
