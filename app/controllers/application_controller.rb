class ApplicationController < ActionController::Base

  before_action :set_locale

  private def set_locale
    I18n.locale = params[:locale] || "en"
  end


  ### Deviseの拡張 - サインイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if resource.is_a?(Seller)
      sellers_root_path
    elsif resource.is_a?(User)
      root_path
    end
  end

end
