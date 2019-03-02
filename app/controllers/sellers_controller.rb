class SellersController < ApplicationController

  def index
  end

  def show
    @seller = Seller.find(params[:id])
    @tender_rule = @seller.tender_rule
    @tenders = @seller.tenders.ongoing.order(:starts_at)
  end

  # GET (member)
  def coming
    @seller = Seller.find(params[:id])
    @tender_rule = @seller.tender_rule
    @tenders = @seller.tenders.coming.order(:starts_at)
    render action: :show
  end

  # GET (member)
  def finished
    @seller = Seller.find(params[:id])
    @tender_rule = @seller.tender_rule
    @tenders = @seller.tenders.finished.order(:starts_at)
    render action: :show
  end

end
