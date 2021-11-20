class ProfileController < ApplicationController
    before_action :set_sidebar
  
    def view
        @account = Account.find(params[:id])
    end

    private
    def set_sidebar
        @enable_sidebar = true
    end

  end
  