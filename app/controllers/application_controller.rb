class ApplicationController < ActionController::Base
  include Pundit
  
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

    def user_not_authorized
      policy_name = exception.policy.class.to_s.underscore

      flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_to root_path
    end
  
    def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation, :user_type, :name, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
end
