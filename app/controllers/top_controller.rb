class TopController < ApplicationController
  def index
    @autoparts = Autopart.all
  end
end
