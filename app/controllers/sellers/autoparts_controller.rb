class Sellers::AutopartsController < ApplicationController
  before_action :authenticate_seller!

  def index
    @seller = current_seller
    @autoparts = @seller.autoparts
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
