class Sellers::TendersController < ApplicationController

  before_action :authenticate_seller!

  def index
    @tenders = current_seller.tenders.order(id: :desc)
  end

  def show
    @tender = Tender.find(params[:id])
    @engines = @tender.engines
  end

  def new
    @tender = Tender.new
    time0 = Time.current.beginning_of_day
    @tender.starts_at = time0.advance(days: 1, hours: 9)
    @tender.ends_at = time0.advance(days: 3, hours: 12)
    @tender_location_candidates = current_seller.tender_locations
  end

  def edit
    @tender = Tender.find(params[:id])
    @tender_location_candidates = current_seller.tender_locations
  end

  def create
    @tender = Tender.new(tender_params)
    @tender.seller = current_seller
    if @tender.save
      flash.notice = "入札会を設定しました。掲載商品を追加してください。"
      redirect_to sellers_tender_path(@tender)
    else
      render "new"
    end
  end

  def update
    @tender = Tender.find(params[:id])
    @tender.assign_attributes(tender_params)
    if @tender.save
      flash.alert = "入札会の設定をupdateしました。"
      redirect_to sellers_tender_path(@tender)
    else
      render "edit"
    end
  end

  def destroy
    @tender = Tender.find(params[:id])
    @tender.destroy!

    redirect_to :sellers_tenders, alert: "入札会を削除しました。"
  end

  private def tender_params
    params[:tender].permit(
      :seller_id, :tender_location_id,
      :starts_at_date_part, :starts_at_time_part,
      :ends_at_date_part, :ends_at_time_part,
      :status
    )
  end

end
