class TopController < ApplicationController

  before_action :authenticate_user!, only:[:mypage, :bidded_items]

  def index
    @engines = Engine.all.order(updated_at: :desc)
    @coming_tenders = Tender.open.all.order(:starts_at)
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
