class TopController < ApplicationController

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  before_action :authenticate_user!, only:[:mypage, :bidded_items]

  def index
    # coming_and_progress_tenders = Tender.where('ends_at > ?', T1)
    # coming_and_progress_tenders.each do |tender|
      # @engines = []
      # @engines << tender.engines
    # end
    @engines = Engine.all.order(:updated_at).page(params[:page])
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
