class TopController < ApplicationController
  def index
    @autoparts = Autopart.all.order(updated_at: :desc)
  end

  def corporation
  end
  
end
