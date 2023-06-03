class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_out_path_for(_use_or_resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(_resource)
    users_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name bio password password_confirmation])
  end
end
