class Sellers::TendersController < ApplicationController
  I18n.locale = "ja"

  before_action :authenticate_seller!


  def index
    @tenders = current_seller.tenders.order(:starts_at)
  end

  def show
    @tender = Tender.find(params[:id])
  end

  def new
    @tender = Tender.new
    time0 = Time.current.beginning_of_day
    @tender.starts_at = time0.advance(days: 1, hours: 10)
    @tender.ends_at = time0.advance(days: 3, hours: 15)
  end

  def create
    @tender = Tender.new(tender_params)
    @tender.seller = current_seller
    if @tender.save
      binding.pry
      flash.notice = "入札会を設定しました。"
      redirect_to :sellers_tenders
    else
      render "new"
    end
  end

  def edit
  end

  private def tender_params
    params[:tender].permit(
      :starts_at_date_part, :starts_at_time_part,
      :ends_at_date_part, :ends_at_time_part
    )
  end

end
