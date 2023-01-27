class Dashboard::BanksController < DashboardController
  before_action :set_banks, only: %i[edit update]
  def index
    @banks = current_user.banks.order(name: :asc)
  end

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(banks_params)
    @bank.user_id = current_user.id
    if @bank.save
      redirect_to dashboard_banks_path, notice: 'Bank was successfully created.'
    else
      alert_errors
    end
  end

  def edit; end

  def update
    if @bank.update(banks_params)
      redirect_to dashboard_banks_path, notice: 'Bank was successfully updated.'
    else
      alert_errors
    end
  end

  private

  def alert_errors
    redirect_to dashboard_banks_path, alert: @bank.errors.full_messages.to_sentence
  end

  def set_banks
    @bank = Bank.find(params[:id])
  end

  def banks_params
    params.require(:bank).permit(:name, :number, :status, :user_id)
  end
end
