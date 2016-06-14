module BeachData
  class WaterQualityAutoSenseReading
    # This class represents a specific reading from the endpoint
    # at data.cityofchicago.org/resource/46rk-hgnz.json
    # Quoting from the Beach Water Quality - Automated Sensors
    # webpage:
    # "The Chicago Park District maintains sensors in the water at
    # beaches along Chicago's Lake Michigan lakefront. These sensors
    # generally capture the indicated measurements hourly while the
    # sensors are in operation during the summer. During other seasons
    # and at some other times, information from the sensors may not
    # be available. See https://data.cityofchicago.org/d/k7hf-8y75 for
    # a dataset with land-based weather measurements at selected
    # beaches. The sensor locations are listed at 
    # https://data.cityofchicago.org/d/g3ip-u8rb."
    
    class << self
      def latest_readings
        client = make_client
        one_day_ago = (Time.now - 1.day).to_s(:soda)
        readings = client.get(
          DATASET_ID,
          "$where" => "measurement_timestamp > '#{one_day_ago}'",
          "$order" => "measurement_timestamp DESC",
          "$limit" => "3",
        )
        readings.map { |r| BeachData::WaterQualityAutoSenseReading.new(r) }
      end

      private

      DATASET_ID = '46rk-hgnz'

      def make_client
        SODA::Client.new(
          domain: 'data.cityofchicago.org',
          app_token: ENV['$CHICAGO_BEACH_APP_TOKEN'],
        )
      end
    end

    attr_reader(
      :battery_life,
      :beach_name,
      :measurement_id,
      :measurement_timestamp,
      :measurement_timestamp_label,
      :transducer_depth,
      :turbidity,
      :water_temperature,
      :wave_height,
      :wave_period,
    )

    # Reading is a Hashie::Mash when it is returned by soda-ruby
    def initialize(reading)
      @battery_life = reading.battery_life
      @beach_name = reading.beach_name
      @measurement_id = reading.measurement_id
      @measurement_timestamp = set_date_time(reading.measurement_timestamp)
      @measurement_timestamp_label = reading.measurement_timestamp_label
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

    private

    # The arrogant Chi_data_api just uses local time with no stamp :/
    # So we add it in manually with -05:00
    def set_date_time(api_time)
      DateTime.strptime("#{api_time}-05:00", '%Y-%m-%dT%H:%M:%S.%L%z')
    end
  end
end
