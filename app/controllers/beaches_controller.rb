class BeachesController < ApplicationController
  def index
    @beaches = Unirest.get('https://data.cityofchicago.org/resource/46rk-hgnz.json').body
  end

  def show
  end
end
