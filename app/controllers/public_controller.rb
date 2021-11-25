class PublicController < ApplicationController
  def main
    if account_signed_in?
      if current_account.admin?
        path = accounts_path
      elsif account_signed_in? && current_account.role == "seller"
        path = dashboard_path
      else
        path = profile_path(current_account.id)
      end
      path = current_account.admin ? accounts_path : dashboard_path
      redirect_to path, flash: {success: "Successfully Signed In!"} and return
    end
    @properties = Property.latest
    @posts = Blog.latest
  end
end
