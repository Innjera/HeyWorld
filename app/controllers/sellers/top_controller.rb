class Sellers::TopController < ApplicationController
  before_action :authenticate_seller!, only:[:index, :account_info]

  def index
  end

  def account_info
    @seller = current_seller
  end

end
