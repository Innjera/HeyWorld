class CorporateController < ApplicationController
  layout 'corporate'

  def top
    redirect_to "https://www.seibii.com"
  end
end
