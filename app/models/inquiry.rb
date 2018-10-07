class Inquiry
  include ActiveModel::Model

  # Formで使用するプロパティの定義
  attr_accessor :company_name, :company_tell, :company_url, :email, :email_confirmation, :contents

end
