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

  describe "#initialize" do
    it "it assigns api data to instance variables" do
      reading = BeachData::WaterQualityAutoSenseReading.new(@response)
      instance_vars = [
        :@battery_life,
        :@beach_name,
        :@measurement_id,
        :@measurement_timestamp,
        :@measurement_timestamp_label,
        :@transducer_depth,
        :@turbidity,
        :@water_temperature,
        :@wave_height,
        :@wave_period,
      ]
      expect(reading.instance_variables).to match_array(instance_vars)
    end
  end

  describe "#fahrenheit_water_temperature" do
    it "converts water_temperature from C and returns F" do
      reading = BeachData::WaterQualityAutoSenseReading.new(@response)
      temp_in_fahrenheit = reading.fahrenheit_water_temperature
      expect(temp_in_fahrenheit).to eq(68.5)
    end
  end
end
