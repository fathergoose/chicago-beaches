require 'rails_helper'

RSpec.describe Beach, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe "#to_fahrenheit" do
    it "converts a temperature units from C to F" do
      beach = Beach.new
      beach.water_temperature = 16
      temp_in_fahrenheit = beach.water_temperature_in_fahrenheit
      expect(temp_in_fahrenheit).to eq(60.8)
    end
  end

end
