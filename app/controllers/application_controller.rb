class ApplicationController < ActionController::Base
    before_action :configure_premitted_parameters, if: :devise_controller?
    before_action :set_sidebar, only: [:update, :edit]

    protected
    def configure_premitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :url, :profile_picture, :company_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end

    private
    def set_sidebar
        @enable_sidebar = true
    end
end
