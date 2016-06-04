class Beach
  def self.latest_readings
    dataset_id = '46rk-hgnz'
    # "https://data.cityofchicago.org/resource/46rk-hgnz.json?$where=date between '2015-01-10T12:00:00' and '2015-01-10T14:00:00'"
    # This is a querry example that may work
    # TODO: Incorporate a app token into the request though ENV
    # TODO: Impliment latest_readings
    # Okay, doing it all wrong, need to use the 'soda-ruby' gem so as not to re-invent the SDK wheel
    # resp = client.get( "46rk-hgnz", {"$where" => "measurement_timestamp > '2016-06-03T00:00:00' AND measurement_timestamp < '2016-06-04T00:00:00'"})
    # Using the 'soda-ruby' library, this is a working querry


    client = SODA::Client.new({ domain: 'data.cityofchicago.org',
                                app_token: ENV['$CHICAGO_BEACH_APP_TOKEN'] })
    response = client.get( dataset_id, {"$where" => "measurement_timestamp > '2016-06-03T00:00:00' AND measurement_timestamp < '2016-06-04T00:00:00'"})
    beaches = response
  end

end
