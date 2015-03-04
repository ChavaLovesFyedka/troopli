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
    unless member_signed_in? && current_member.is_admin?
      flash[:alert] = "You do not have access to that page."
      redirect_to root_path
    end
  end
end
