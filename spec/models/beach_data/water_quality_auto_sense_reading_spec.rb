require 'rails_helper'

RSpec.describe BeachData::WaterQualityAutoSenseReading, type: :model do
  describe "#fahrenheit_water_temperature" do
    it "converts a temperature units from C to F" do
      # Guess I need some kind of mock response
      water_reading = BeachData::WaterQualityAutoSenseReading.new(mock)
      beach.water_temperature = 16
      temp_in_fahrenheit = beach.water_temperature_in_fahrenheit
      expect(temp_in_fahrenheit).to eq(60.8)
    end
  end
end
