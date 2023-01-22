# frozen_string_literal: true

class User < ApplicationRecord
  # Callbacks
  before_save :capitalize_names

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable

  # Validates
  validates :first_name, :last_name, presence: true, uniqueness: { case_sensitive: false }
  validate :password_regex

  # Capitalize Name
  def capitalize_names
    self.first_name = first_name.split(/ |_/).map(&:capitalize).join(' ')
    self.last_name = last_name.split(/ |_/).map(&:capitalize).join(' ')
  end

  # Validate password
  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/

    errors.add :password,
               ' should have more than 8 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
