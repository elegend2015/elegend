class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, :except => [:terms_of_service]
  before_filter :authenticate_user!, unless: :current_admin_user
  before_filter :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    #request.env['omniauth.origin'] || stored_location_for(resource) || index_path
    
    if resource.is_a?(AdminUser)
        admin_dashboard_path
    else
        demo_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:email,:password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:email,:password, :password_confirmation) }
  end

end