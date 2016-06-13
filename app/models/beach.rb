class Beach
  def self.latest_readings
    BeachData::WaterQualityAutoSenseReading.latest_readings
  end
end
