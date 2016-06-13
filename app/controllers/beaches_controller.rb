class BeachesController < ApplicationController
  def index
    @beaches = Beach.all
  end

  def show
    @beach = Beach.where name: params[:name]
  end
end
