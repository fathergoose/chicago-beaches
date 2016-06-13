class Beach
  # Prehaps the best way to think of "what a beach is" is as an interface. The
  # Beach class will handle all of the things I care about at the beach and the
  # BeachData module is an object wrapper for the dataset.
  # So what is important at a beach?
  # TODO: Water temperature
  # TODO: Wave Height
  # TODO: Wave Peroid
  # TODO: Turbidity
  # TODO: Red/Yellow/Green flags
  # TODO: Air Temperature
  # TODO: Wind Speed
  # TODO: The Name of the Beach
  # The interface will need to provide things like beach.name beach.water_temperature
  def initialize(name)
    
    # There are only so many beaches in chicago so tell me which beach I am eg
    # :montrose then I can collect my data from the BeachData classes
  end
  def self.all
    BeachData::WaterQualityAutoSenseReading.latest_readings
  end
end
