class Sellers::AutopartsController < ApplicationController
  before_action :authenticate_seller!

  def index
  end

  def show
  end

  def new
    @autopart = Autopart.new
  end

  def edit
  end

  def delete
  end
end
