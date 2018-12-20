class Sellers::TenderRulesController < ApplicationController

  before_action :authenticate_seller!

  def show
    @tender_locations = current_seller.tender_locations
    @tender_rule = current_seller.tender_rule
  end

  def new
    @tender_rule = TenderRule.new
  end

  def create
    @tender_rule = TenderRule.new(tender_rule_params)
    @tender_rule.seller = current_seller
    if @tender_rule.save
      flash.notice = "入札会ルールを設定しました。"
      redirect_to sellers_tender_rule_path
    else
      render "new"
    end
  end

  def edit
    @tender_rule = current_seller.tender_rule
  end

  def update
    @tender_rule = current_seller.tender_rule
    @tender_rule.assign_attributes(tender_rule_params)
    if @tender_rule.save
      flash.notice = "入札会ルールをupdateしました。"
      redirect_to sellers_tender_rule_path
    else
      render "edit"
    end
  end

  private def tender_rule_params
    params.require(:tender_rule).permit(
      :seller_id, :payment_cash_in_advance, :payment_bank_transfer_in_advance,
      :payment_credit_card_in_advance, :tax, :delivery,
      :pickup_date, :cancel, :priority, :disclose
    )
  end

end
