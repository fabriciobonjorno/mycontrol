# frozen_string_literal: true

class Bank < ApplicationRecord
  # Validates
  validates :name, :number, presence: true, uniqueness: { case_sensitive: false }
end
