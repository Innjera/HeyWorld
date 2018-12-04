class TopController < ApplicationController
  def index
    @autoparts = Autopart.all.order(updated_at: :desc)
    @tenders = Tender.open.all.order(:starts_at)
  end

  def mypage
    @user = current_user
  end

  def corporation
  end

end
