class SellersController < ApplicationController
  def index
  end

  def show
    @seller = Seller.find(params[:id])
    @tenders = @seller.tenders
  end
end
