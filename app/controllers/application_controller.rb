class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |e|
    redirect_to root_path, alert: e.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :full_name)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :current_password, :full_name)
    end
  end

  def after_sign_in_path_for(resource)
    resource.is_admin? ? admin_dashboard_index_path : user_dashboard_index_path
  end

  def after_sign_up_path_for(resource)
    resource.is_admin? ? admin_dashboard_index_path : user_dashboard_index_path
  end

  def after_sign_out_path_for(resource_or_scope)
    dashboard_index_path
  end
end
