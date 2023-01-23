# frozen_string_literal: true

module MenuResources
  extend ActiveSupport::Concern

  private

  def set_resources
    @groups = Group.where(user_id: current_user.id).where(status: 'active').order(name: :asc) if user_signed_in?
  end
end
