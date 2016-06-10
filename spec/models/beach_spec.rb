require 'rails_helper'

RSpec.describe Beach, type: :model do
  it "should have measurements"
  it "should derive it's attributes from it's measurements"
  it "should have a current_water_temperature method"
  


  describe "#to_fahrenheit" do
    it "converts a temperature units from C to F" do
      beach = Beach.new
      beach.water_temperature = 16
      temp_in_fahrenheit = beach.water_temperature_in_fahrenheit
      expect(temp_in_fahrenheit).to eq(60.8)
    end
  end

end
