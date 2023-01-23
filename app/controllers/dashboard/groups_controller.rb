class Dashboard::GroupsController < DashboardController
  before_action :set_groups, only: %i[edit update]

  def index
    @groups = Group.where(user_id: current_user.id).order(name: :asc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)
    @group.user_id = current_user.id

    if @group.save
      redirect_to dashboard_groups_path, notice: "#{@group.name} successfully registered!"
    else
      alert_errors
    end
  end

  def edit; end

  def update
    if @group.update(groups_params)
      redirect_to dashboard_groups_path, notice: "#{@group.name} updated successfully!"
    else
      alert_errors
    end
  end

  private

  def alert_errors
    redirect_to dashboard_groups_path, alert: @group.errors.full_messages.to_sentence
  end

  def set_groups
    @group = Group.find(params[:id])
  end

  def groups_params
    params.require(:group).permit(:name, :status, :user_id)
  end
end
