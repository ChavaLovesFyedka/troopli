class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    "/"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :leadership_request
  end

  def authenticate_admin!
    # only super admin has access
    unless member_signed_in? && current_member.is_admin?
      reject_access 
    end
  end

  def authenticate_leader!
    # super admin && leaders have access
    if !member_signed_in? || member.is_member?
      reject_access 
    end
  end

  def authenticate_member!
    # super admin && leaders && members have access 
    unless member_signed_in?
      reject_access 
    end
  end

  def reject_access
    flash[:alert] = "You do not have access to that page."
    redirect_to root_path
  end
end
