class Sellers::TenderRulesController < ApplicationController

  before_action :authenticate_seller!

  def show
    @tender_locations = current_seller.tender_locations
  end

  def new
  end
end
