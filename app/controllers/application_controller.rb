class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from "AccessGranted::AccessDenied" do |exception|
    redirect_to root_path, alert: "You don't have permission to access this page."
  end
  
  private
  
    def configure_permitted_parameters
      added_attrs = [:email, :password, :password_confirmation, :user_type, :name, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
    
    def authenticate_active_admin_user!
      if current_admin_user.present? and current_user.blank?
        sign_in current_admin_user, bypass: true
        redirect_to admin_dashboard_path
      end

      super
    end
end
