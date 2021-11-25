class DashboardController < ApplicationController
  before_action :authenticate_account!
  before_action :set_sidebar

  def index
  end

end
