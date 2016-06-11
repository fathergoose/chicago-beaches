module BeachData
  class WaterQualityAutoSenseReading
    attr_reader(:battery_life,
                :beach_name, 
                :measurement_timestamp,
                :transducer_depth,
                :turbidity,
                :water_temperature,
                :wave_height,
                :wave_period)

    def initialize(reading)
      @battery_life = reading["battery_life"]
      @beach_name = reading["beach_name"]
      @measurement_timestamp = reading["measurement_timestamp"]
      @transducer_depth = reading["transducer_depth"]
      @turbidity = reading["turbidity"]
      @battery_life = reading["battery_life"]

  end
end
