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
    find_revenue_paids = User.joins(groups: [accounts: [financials: :installments]])
                             .where(id: current_user.id)
                             .where("#{Financial.table_name}.transaction_type = 0 ")
                             .where("#{Installment.table_name}.status = 0 ")
                             .where("#{Installment.table_name}.due_date > ? AND #{Installment.table_name}.due_date < ? ", Time.now.beginning_of_month, Time.now.end_of_month)
                             .select("sum(#{Installment.table_name}.payment_value)")

    find_revenue_unpaids = User.joins(groups: [accounts: [financials: :installments]])
                               .where(id: current_user.id)
                               .where("#{Financial.table_name}.transaction_type = 0 ")
                               .where("#{Installment.table_name}.status = 1 ")
                               .where("#{Installment.table_name}.due_date > ? AND #{Installment.table_name}.due_date < ? ", Time.now.beginning_of_month, Time.now.end_of_month)
                               .select("sum(#{Installment.table_name}.payment_value)")

    find_expenses_paids = User.joins(groups: [accounts: [financials: :installments]])
                              .where(id: current_user.id)
                              .where("#{Financial.table_name}.transaction_type = 1 ")
                              .where("#{Installment.table_name}.status = 0 ")
                              .where("#{Installment.table_name}.due_date > ? AND #{Installment.table_name}.due_date < ? ", Time.now.beginning_of_month, Time.now.end_of_month)
                              .select("sum(#{Installment.table_name}.payment_value)")

    find_expenses_unpaids = User.joins(groups: [accounts: [financials: :installments]])
                                .where(id: current_user.id)
                                .where("#{Financial.table_name}.transaction_type = 1 ")
                                .where("#{Installment.table_name}.status = 1 ")
                                .where("#{Installment.table_name}.due_date > ? AND #{Installment.table_name}.due_date < ? ", Time.now.beginning_of_month, Time.now.end_of_month)
                                .select("sum(#{Installment.table_name}.payment_value)")

    @revenue_paids = find_revenue_paids[0].sum
    @revenue_unpaids = find_revenue_unpaids[0].sum
    @expense_paids = find_expenses_paids[0].sum
    @expense_unpaids = find_expenses_unpaids[0].sum

    @groups = Group.where(user_id: current_user.id)
    @link = Rails.env.production? ? 'https://mycontrol.fly.dev/' : 'http://localhost:3000/'
  end
end
