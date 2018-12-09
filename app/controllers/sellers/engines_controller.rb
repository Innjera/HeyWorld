class Sellers::EnginesController < ApplicationController
  before_action :authenticate_seller!

  def index
  end

  def show
  end

  def new
    @current_tender = Tender.find(params[:tender_id])
    @engine = Engine.new
  end

  def edit
  end

  def create
    current_tender = Tender.find(params[:id])
    @engine = Engine.new(engine_params)
    @engin.tender = current_seller
    binding.pry
    if @autopart.save
      flash.notice = "製品を新規登録しました。"
      redirect_to :sellers_autoparts
    else
      render "new"
    end
  end

  def update
  end

  private def engine_params
    params.require(:autopart).permit(
      :tender_id, :car_make, :car_model, :car_model_code,
      :registration_year, :condition, :engine_model_code,
      :mileage, :drive, :mission_type, :starter, :alternator,
      :compressor, :power_steering_pump, :ecu,
      :engine_harness, :front_suspension, :rear_suspension,
      :remarks, :minimum_price, :sold
    )
  end

end
