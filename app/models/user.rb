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

  # Relationship
  has_many :banks, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :accounts, through: :groups

  # Profile photo
  has_one_attached :photo_profile

  # Capitalize Name
  def capitalize_names
    self.first_name = first_name&.split(/ |_/)&.map(&:capitalize)&.join(' ') unless first_name.blank?
    self.last_name = last_name&.split(/ |_/)&.map(&:capitalize)&.join(' ') unless last_name.blank?
  end

  def full_name
    "#{first_name} #{last_name} "
  end

  # Validate password
  def password_regex
    return if password.blank? || password =~ /\A(?=.*\d)(?=.*[A-Z])(?=.*\W)[^ ]{8,}\z/

    errors.add :password,
               ' should have more than 8 characters including 1 uppercase letter, 1 number, 1 special character'
  end
end
