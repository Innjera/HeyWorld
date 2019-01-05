class SellersController < ApplicationController

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  def index
  end

  def show
    @seller = Seller.find(params[:id])
    @tender_rule = @seller.tender_rule
    @tenders = @seller.tenders.where('starts_at < ? AND ends_at > ?', T1, T1 ).order(:starts_at)
  end

  # GET (member)
  def coming
    @seller = Seller.find(params[:id])
    @tender_rule = @seller.tender_rule
    @tenders = @seller.tenders.where('starts_at > ?', T1).order(:starts_at)
    render action: :show
  end

  # GET (member)
  def finished
    @seller = Seller.find(params[:id])
    @tender_rule = @seller.tender_rule
    @tenders = @seller.tenders.where('starts_at < ? AND ends_at < ?', T1, T1 ).order(:starts_at)
    render action: :show
  end

end
