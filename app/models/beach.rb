    # "https://data.cityofchicago.org/resource/46rk-hgnz.json?$where=date between '2015-01-10T12:00:00' and '2015-01-10T14:00:00'"
    # This is a querry example that may work
    # TODO: Incorporate a app token into the request though ENV
    # TODO: Impliment latest_readings
    # Okay, doing it all wrong, need to use the 'soda-ruby' gem so as not to re-invent the SDK wheel
    # resp = client.get( "46rk-hgnz", {"$where" => "measurement_timestamp > '2016-06-03T00:00:00' AND measurement_timestamp < '2016-06-04T00:00:00'"})
    # using the 'soda-ruby' library, this is a working querry


    Time::DATE_FORMATS[:soda] = '%Y-%m-%dT%H:%M:%S'

class Beach
  attr_accessor :water_temperature
  def self.latest_readings
      dataset_id = '46rk-hgnz'


    right_now = Time.now.to_s :soda
    an_hour_ago = (Time.now - 1.hour).to_s :soda
    two_hours_ago = (Time.now - 2.hour).to_s :soda
    one_day_ago = (Time.now - 1.day).to_s :soda

    puts 'NOWNOWNOWNOWNOWNOWNOWNOW'
    puts right_now
    puts an_hour_ago
    puts one_day_ago

    client = SODA::Client.new({ domain: 'data.cityofchicago.org',
                                app_token: ENV['$CHICAGO_BEACH_APP_TOKEN'] })
    response = client.get( dataset_id,
                          {"$where" => "measurement_timestamp > '#{two_hours_ago}'",
                           "$order" => "measurement_timestamp DESC"})
    beaches = response
  end


  def water_temperature_in_fahrenheit
    water_temperature * 1.8 + 32
  end

end
