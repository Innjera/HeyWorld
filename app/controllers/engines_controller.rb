class EnginesController < ApplicationController
  def show
    error_messages = flash[:error_messages] if error_messages.present?
    @engine = Engine.find(params[:id])
    @tender_rule = @engine.seller.tender_rule
    @bid_price = BidPrice.new
  end
end
