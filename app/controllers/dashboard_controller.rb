class DashboardController < ApplicationController
  before_action :set_sidebar

  def index
  end

  private
  def set_sidebar
    @enable_sidebar = true
  end
end
