require 'rails_helper'

RSpec.describe BeachData::WaterQualityAutoSenseReading, type: :model do
  before :each do
      sample_data = {
        battery_life: "9.4",
        beach_name: "Montrose Beach",
        measurement_id: "MontroseBeach201308300800",
        measurement_timestamp: "2013-08-30T08:00:00.000",
        measurement_timestamp_label: "8/30/2013 8:00 AM",
        transducer_depth: "0.891",
        turbidity: "1.18",
        water_temperature: "20.3",
        wave_height: "0.08",
        wave_period: "3",
      }
      @response = Hashie::Mash.new(sample_data)
  end

  describe "#fahrenheit_water_temperature" do
    it "converts a temperature units from C to F" do
      reading = BeachData::WaterQualityAutoSenseReading.new(@response)
      temp_in_fahrenheit = reading.fahrenheit_water_temperature
      expect(temp_in_fahrenheit).to eq(68.5)
    end
  end
end
