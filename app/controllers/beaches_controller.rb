class BeachesController < ApplicationController
  def index
    @beaches = Beach.latest_readings
  end

  def show
  end
end
