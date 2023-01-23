# frozen_string_literal: true

class DashboardController < ApplicationController
  include MenuResources
  before_action :authenticate_user!
  before_action :set_resources, only: %i[index]
  layout 'dashboard'
  def index
    @expire_today = Installment.where(status: 'unpaid', due_date: Date.today).order(due_date: :asc)
    @expire_week = Installment.where(status: 'unpaid')
                              .where('due_date > ? and due_date <= ?', Date.today, Date.today + 1.week)
                              .order(due_date: :asc)
  end
end
