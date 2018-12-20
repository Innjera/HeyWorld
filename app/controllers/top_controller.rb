class TopController < ApplicationController
  def index
    @engines = Engine.all.order(updated_at: :desc)
    @coming_tenders = Tender.open.all.order(:starts_at)
  end

  def mypage
    @user = current_user
  end

  def corporation
  end

end
