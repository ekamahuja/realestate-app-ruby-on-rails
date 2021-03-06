class ApplicationController < ActionController::Base
    before_action :configure_premitted_parameters, if: :devise_controller?
    before_action :set_sidebar, only: [:update, :edit]


    protected
    def configure_premitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :url, :profile_picture, :role, :company_name, :phone_number, :description, :profile_cover_image])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :phone_number])
    end

    private
    def set_sidebar
        @enable_sidebar = true if account_signed_in?
    end

    def can_access?
        unless current_account.admin?
            redirect_to dashboard_path, alert: "You do not have admin privlages." and return
        end
    end
end
