class Sellers::TendersController < ApplicationController
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
    Tender.create!(params[:tender])

    redirect_to :sellers_tenders
  end

  private def tenders_params
    params.require(:tender).permit(
      :starts_at, :starts_at_date_part, :starts_at_time_parts,
      :ends_at, :ends_at_date_part, :ends_at_time_part
    )
  end

end
