class ApplicationController < ActionController::Base
    before_action :configure_premitted_parameters, if: :devise_controller?

    protected
    def configure_premitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :url, :profile_picture, :company_name])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
end
