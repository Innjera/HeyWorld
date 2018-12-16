class Sellers::TenderLocationsController < ApplicationController

  before_action :authenticate_seller!

  def new
    @tender_location = TenderLocation.new
  end

  def edit
    @tender_location = TenderLocation.find(params[:id])
  end

  def create
    @tender_location = TenderLocation.new(tender_location_params)
    @tender_location.address_country_part = "Japan"
    @tender_location.seller = current_seller
    if @tender_location.save
      flash.notice = "入札開催場所を追加しました。"
      redirect_to sellers_tender_rule_path
    else
      render "new"
    end
  end

  def update
    @tender_location = TenderLocation.find(params[:id])
    @tender_location.assign_attributes(tender_location_params)
    if @tender_location.save
      redirect_to sellers_tender_rule_path, notice: "入札開催場所をupdateしました。"
    else
      render "edit"
    end
  end

  def destroy
    @tender_location = TenderLocation.find(params[:id])
    @tender_location.destroy!

    redirect_to sellers_tender_rule_path, alert: "削除しました。"
  end

  private def tender_location_params
    params.require(:tender_location).permit(
      :seller_id, :address, :address_country_part,
      :address_prefecture_part, :address_city_part, :address_rest_part
    )
  end

end
