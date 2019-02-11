class ApplicationController < ActionController::Base

  ### 多言語化
  before_action :set_locale

  def set_locale
    I18n.locale = locale
  end

  def locale
    # ここで言語の切り替えを行う
    @locale ||= params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    options.merge(locale: locale)
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
