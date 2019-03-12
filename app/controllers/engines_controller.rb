class EnginesController < ApplicationController
  def show
    engines = Engine.joins(:tender).where('preparation_status= ?', "1")
    @engine = engines.find(params[:id])
    @tender_rule = @engine.seller.tender_rule
    @bid_price = BidPrice.new
  end
end
