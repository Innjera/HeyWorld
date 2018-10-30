class RegistrationsController < Devise::RegistrationsController

  ### Deviseの拡張 - アカウントアップデート後のリダイレクト先

  protected
  def after_update_path_for(resource)
    sellers_account_info_path
  end

end
