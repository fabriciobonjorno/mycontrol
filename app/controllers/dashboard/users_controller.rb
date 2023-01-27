# frozen_string_literal: true

module Dashboard
  class UsersController < DashboardController
    include MenuResources
    before_action :set_resources, only: %i[edit]
    before_action :set_users, only: %i[edit update]
    before_action :allow_without_password, only: [:update]

    def edit
      return if params[:id] == current_user.id

      redirect_to root_path, alert: 'You are not allowed to edit another user'
    end

    def update
      if @user.update(users_params)
        redirect_to root_path, notice: "#{@user.first_name} successfully updated!"
      else
        alert_errors
      end
    end

    private

    def alert_errors
      redirect_to edit_dashboard_user_path(current_user), alert: @user.errors.full_messages.to_sentence
    end

    def set_users
      @user = User.find(params[:id])
    end

    def users_params
      params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :photo_profile)
    end

    # remove o input da validação do devise
    def allow_without_password
      return unless params[:user][:password].blank? && params[:user][:password_confirmation].blank?

      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
  end
end
