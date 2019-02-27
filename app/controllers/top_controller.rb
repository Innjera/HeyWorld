class TopController < ApplicationController

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  before_action :authenticate_user!, only:[:mypage, :bidded_items]

  def index
    engines = Engine.joins(:tender).where('preparation_status= ?', "1")
    @open_engines = engines.joins(:tender).where('ends_at >= ?', Time.current).page(params[:page])
    @coming_tenders = Tender.where('starts_at > ?', T1 ).open.order(:starts_at)
  end

  def mypage
    @user = current_user
  end

  def bidded_items
    @bidded_engines =  current_user.bidded_engines
  end

  def corporation
  end

end
