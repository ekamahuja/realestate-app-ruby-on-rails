class AdminController < ApplicationController
    before_action :can_access?

    def accounts
        @accounts = Account.where(admin: false)
    end

    def can_access?
        @enable_sidebar = true
        unless current_account.admin?
            redirect_to root_path, flash: { danger: "You do not have admin privlages" }
        end
    end

end
  