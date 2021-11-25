class PublicController < ApplicationController
  def main
    if account_signed_in?
      if current_account.admin?
        path = accounts_path
      elsif account_signed_in? && current_account.role == "seller"
        path = dashboard_path
      elsif account_signed_in? && current_account.role == "buyer"
        path = properties_view_all_path
      end
      redirect_to path and return
    end
    @properties = Property.latest
    @posts = Blog.latest
  end
end
