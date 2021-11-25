class AdminController < ApplicationController
    before_action :can_access?
    before_action :set_sidebar

    def accounts
        @accounts = Account.where(admin: false)  
    end

end
  