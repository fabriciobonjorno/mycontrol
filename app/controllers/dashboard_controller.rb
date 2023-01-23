# frozen_string_literal: true

class DashboardController < ApplicationController
  include MenuResources
  before_action :authenticate_user!
  before_action :set_resources, only: %i[index]
  layout 'dashboard'
  def index; end
end
