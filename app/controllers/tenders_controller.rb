class TendersController < ApplicationController
  def index

  end

  def show
    @tender = Tender.find(params[:id])
    @engines = @tender.engines
  end
end
