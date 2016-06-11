    # "https://data.cityofchicago.org/resource/46rk-hgnz.json?$where=date between '2015-01-10T12:00:00' and '2015-01-10T14:00:00'"
    # This is a querry example that may work
    # TODO: Incorporate a app token into the request though ENV
    # TODO: Impliment latest_readings
    # Okay, doing it all wrong, need to use the 'soda-ruby' gem so as not to re-invent the SDK wheel
    # resp = client.get( "46rk-hgnz", {"$where" => "measurement_timestamp > '2016-06-03T00:00:00' AND measurement_timestamp < '2016-06-04T00:00:00'"})
    # using the 'soda-ruby' library, this is a working querry


Time::DATE_FORMATS[:soda] = '%Y-%m-%dT%H:%M:%S'

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
