class ApplicationController < ActionController::Base
    before_action :configure_premitted_parameters, if: :devise_controller?

    protected
    def configure_premitted_parameters
        devise_parameter_sanitizer.permit(:udpate, keys: [:first_name, :last_name, :url])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    end
end
