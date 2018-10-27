class AutopartsController < ApplicationController
  def show
    @autoparts = Autopart.find(params[:id])
  end
end
