class SellersController < ApplicationController
  def index
  end

  def show
    @seller = Seller.find(params[:id])
    @tenders = @seller.tenders
    @tender_rule = @seller.tender_rule
  end
end
