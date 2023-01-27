# frozen_string_literal: true

module Dashboard
  class AccountsController < DashboardController
    include MenuResources
    before_action :set_resources, only: %i[index]
    before_action :set_accounts, only: %i[edit update]
    before_action :find_groups, only: %i[new edit]
    before_action :find_banks, only: %i[new edit]

    def index
      @accounts = Account.where(group: current_user.groups).order(account: :asc)
    end

    def new
      @account = Account.new
    end

    def create
      @account = Account.new(accounts_params)
      if @account.save
        redirect_to dashboard_accounts_path, notice: 'Account successfully registered!'
      else
        alert_errors
      end
    end

    def edit; end

    def update
      if @account.update(accounts_params)
        redirect_to dashboard_accounts_path, notice: 'Account updated successfully!'
      else
        alert_errors
      end
    end

    def find_groups
      @groups = current_user.groups.where(status: 'active').order(name: :asc)
    end

    def find_banks
      @banks = current_user.banks.where(status: 'active').order(name: :asc)
    end

    private

    def alert_errors
      redirect_to dashboard_accounts_path, alert: @account.errors.full_messages.to_sentence
    end

    def set_accounts
      @account = Account.find(params[:id])
    end

    def accounts_params
      params.require(:account).permit(:agency, :account, :balance, :status, :account_type, :bank_id,
                                      :group_id)
    end
  end
end
