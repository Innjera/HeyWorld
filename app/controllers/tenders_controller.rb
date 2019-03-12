class TendersController < ApplicationController

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  def index

  end

  def show
    tenders = Tender.all.open
    @tender = tenders.find(params[:id])
    @engines = @tender.engines
  end
end
