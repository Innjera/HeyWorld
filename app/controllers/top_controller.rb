class TopController < ApplicationController
  def index
    @autoparts = Autopart.all.order(updated_at: :desc)
  end

  def mypage
    @user = current_user
  end

  def corporation
  end

end
