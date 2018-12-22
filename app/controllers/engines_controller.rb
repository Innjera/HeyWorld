class EnginesController < ApplicationController
  def show
    @engine = Engine.find(params[:id])
    @tender_rule = @engine.seller.tender_rule
    @bid_price = BidPrice.new
  end
end
