# frozen_string_literal: true

class DashboardController < ApplicationController
  include MenuResources
  before_action :authenticate_user!
  before_action :set_resources, only: %i[index]
  layout 'dashboard'
  def index
    revenue
  end

  private

  def revenue
    user_id = current_user.id

    @revenue_paids = GetPaymentsSumServices.new(user_id, :revenue, :paid).call
    @revenue_unpaids = GetPaymentsSumServices.new(user_id, :revenue, :unpaid).call
    @expense_paids = GetPaymentsSumServices.new(user_id, :expense, :paid).call
    @expense_unpaids = GetPaymentsSumServices.new(user_id, :expense, :unpaid).call

    @groups = Group.where(user_id: current_user.id)
  end
end
