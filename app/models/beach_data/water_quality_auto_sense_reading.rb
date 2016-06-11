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
      @battery_life = reading.battery_life
      @beach_name = reading.beach_name
      @measurement_timestamp = set_date_time(reading.measurement_timestamp)
      @transducer_depth = reading.transducer_depth
      @turbidity = reading.turbidity
      @water_temperature = reading.water_temperature
      @wave_height = reading.wave_height
      @wave_period = reading.water_temperature
    end

    def fahrenheit_water_temperature
      fahrenheit_float = @water_temperature.to_f * 1.8 + 32
      fahrenheit_float.round(1)
    end

    def human_friendly_time
      seconds_ago = Time.now - @measurement_timestamp
      if seconds_ago < 3600
        "less than an hour ago"
      elsif seconds_ago < 4800
        "about an hour ago"
      elsif seconds_ago < 6000
        "about an hour and a half ago"
      else
        hours_ago = seconds_ago / 3600
        "about #{hours_ago.round(0)} hours ago"
      end
    end

    private

    def set_date_time(api_time)
      # The arrogant Chi_data_api just uses local time with no stamp :/
      # So we add it in manually as -05:00
      DateTime.strptime("#{api_time}-05:00", '%Y-%m-%dT%H:%M:%S.%L%z')
    end
  end
end
