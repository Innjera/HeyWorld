class Sellers::TopController < ApplicationController
  before_action :authenticate_seller!, only:[:index]

  def index
  end
end
