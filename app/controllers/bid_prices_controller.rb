class BidPricesController < ApplicationController

  before_action :authenticate_user!, only:[:create]

  def create
    bidded_engine = Engine.find(params[:engine_id])
    @bid_price = BidPrice.new(bid_price_params)
    @bid_price.user = current_user
    @bid_price.engine = bidded_engine
    if @bid_price.valid?
      @bid_price.save!
      flash.notice = "Your Price has been submitted!"
      redirect_to tender_engine_path(bidded_engine.tender, bidded_engine)
    else
      binding.pry
      # @engine = bidded_engine
      # @tender_rule = @engine.seller.tender_rule
      # @tender = @engine.tender
      # render "engines/show"
      redirect_to tender_engine_path(bidded_engine.tender, bidded_engine)
    end
  end


  private def bid_price_params
    params.require(:bid_price).permit(
      :user_id, :engine_id, :price
    )
  end
end
