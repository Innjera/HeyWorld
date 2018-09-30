class ApplicationController < ActionController::Base

  ### Deviseの拡張
  before_action :configure_permitted_parameters, if: :devise_controller?

  ### Deviseの拡張
  def after_sign_in_path_for(resource)
    sellers_root_path
  end

  ### Deviseの拡張
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_address, :company_url, :company_tell])
  end
end
