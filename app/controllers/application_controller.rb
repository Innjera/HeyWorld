class ApplicationController < ActionController::Base

  ### Deviseの拡張
  before_action :configure_permitted_parameters, if: :devise_controller?

  ### Deviseの拡張 - サインイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if resource.is_a?(Seller)
      sellers_root_path
    elsif resource.is_a?(User)
      root_path
    end
  end

  ### Deviseの拡張
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_address, :company_url, :company_tell])
    devise_parameter_sanitizer.permit(:account_update, keys: [:company_name, :company_address, :company_url, :company_tell])
  end
end
