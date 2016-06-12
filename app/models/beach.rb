class Beach
  def self.latest_readings
    dataset_id = '46rk-hgnz'
    one_day_ago = (Time.now - 1.day).to_s :soda
    client = SODA::Client.new({ domain: 'data.cityofchicago.org',
                                app_token: ENV['$CHICAGO_BEACH_APP_TOKEN'] })
    readings = client.get( dataset_id,
                          {"$where" => "measurement_timestamp > '#{one_day_ago}'",
                           "$order" => "measurement_timestamp DESC",
                           "$limit" => "3"})
    readings.map { |r| BeachData::WaterQualityAutoSenseReading.new(r) }
  end
end
