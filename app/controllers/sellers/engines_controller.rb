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
    current_tender = Tender.find(params[:tender_id])
    @engine = Engine.new(engine_params)
    @engine.tender = current_tender
    @engine.seller = current_seller
    binding.pry
    if @engine.save
      flash.notice = "エンジンを登録しました。"
      redirect_to sellers_tender_path(current_tender)
    else
      render "new"
    end
  end

  def update
  end

  private def engine_params
    params.require(:engine).permit(
      :seller_id, :tender_id, :car_make, :car_model, :car_model_code,
      :registration_year, :condition, :engine_model_code,
      :mileage, :drive, :mission_type, :starter, :alternator,
      :compressor, :power_steering_pump, :ecu,
      :engine_harness, :front_suspension, :rear_suspension,
      :remarks, :minimum_price, :sold
    )
  end

end
