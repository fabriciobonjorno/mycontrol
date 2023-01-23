# frozen_string_literal: true

module Dashboard
  class FinancialsController < DashboardController
    include MenuResources
    before_action :set_resources, only: %i[list_transction]
    before_action :set_financials, only: %i[edit update]
    before_action :find_accounts, only: %i[new edit]

    # def index
    #   @financials = Financial.where(account_id: current_user.accounts).order(created_at: :asc)
    # end

    def new
      @financial = Financial.new
    end

    def create
      @financial = Financial.new(financials_params)
      if @financial.save
        redirect_to url_default, notice: 'Transaction performed successfully!'
      else
        redirect_to url_default, alert: @financial.errors.full_messages.to_sentence
      end
    end

    def edit; end

    def update
      if @financial.update(financials_params)
        redirect_to url_default, notice: 'Transaction performed successfully!'
      else
        redirect_to url_default, alert: @financial.errors.full_messages.to_sentence
      end
    end

    def change_paid
      @installment = Installment.find(params[:financial_id])
      @installment.status = params[:status]
      @installment.payment_date = params[:payment_date]
      if @installment.save
        flash[:notice] = 'Payment made successfully!'
      else
        flash[:alert] = @installment.errors.full_messages.to_sentence
      end
    end

    def find_accounts
      @accounts = Account.where(group_id: params[:group])
    end

    def list_transction
      @transaction = Group.find_by(id: params[:group])
    end

    def url_default
      list_transction_dashboard_financials_path(group: params[:group])
    end

    private

    def set_financials
      @financial = Financial.find(params[:id])
    end

    def financials_params
      params.require(:financial).permit(:transaction_type, :account_id,
                                        installments_attributes: %i[name number payment_value payment_date due_date note status financial_id _destroy])
    end
  end
end
