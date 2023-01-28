# frozen_string_literal: true

class UsersServices
  def initialize(user)
    @user = user
  end

  def call
    capitalize_names
  end

  private

  def capitalize_names
    @user.first_name = @user.first_name&.split(/ |_/)&.map(&:capitalize)&.join(' ') unless @user.first_name.blank?
    @user.last_name = @user.last_name&.split(/ |_/)&.map(&:capitalize)&.join(' ') unless @user.last_name.blank?
  end
end
