class Sellers::AutopartsController < ApplicationController
  before_action :authenticate_seller!

  def index
    @seller = current_seller
    @autoparts = @seller.autoparts.order(updated_at: :desc)
  end

  def show
    @autopart = Autopart.find(params[:id])
  end

  def new
    @autopart = Autopart.new
    @autopart.build_offer_price
  end

  def edit
    @autopart = Autopart.find(params[:id])
  end

  def create
    @autopart = Autopart.new(autoparts_params)
    @autopart.seller = current_seller
    if @autopart.save
      flash.notice = "製品を新規登録しました。"
      redirect_to :sellers_autoparts
    else
      render "new"
    end
  end

  def update
    @autopart = Autopart.find(params[:id])
    @autopart.assign_attributes(autoparts_params)
    if @autopart.save
      flash.notice = "登録製品情報をアップデートしました。"
      redirect_to sellers_autopart_path
    else
      render "edit"
    end
  end

  def destroy
    @autopart = Autopart.find(params[:id])
    @autopart.destroy!
    flash.alert = "削除しました。"

    redirect_to :sellers_autoparts
  end

  private def autoparts_params
    params.require(:autopart).permit(
      :seller_id, :parts_category, :string, :condition, :car_brand, :car_model,
      :registration_year, :model_code, :fuel_type, :mileage, :mission_type,
      :engine_model_code, :drive, :autoparts_maker, :genuine_parts_number,
      :remarks, :sold,
      offer_price_attributes: [
        :autopart_id, :initial
      ]
    )
  end
end
