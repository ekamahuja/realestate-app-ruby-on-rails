class AdminController < ApplicationController
    before_action :can_access?

    def accounts
        @accounts = Account.where(admin: false)
    end

    

end
  