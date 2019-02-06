class Station
  FUEL_TYPES = {"ELEC" => "Electric",
                "LPG" => "Propane"}

  attr_reader :name, :address, :type, :access_times

  def initialize(params)
    @name = params[:station_name]
    @address = params[:street_address]
    @type = FUEL_TYPES[params[:fuel_type_code]]
    @distance = params[:distance]
    @access_times = params[:access_days_time]
  end

  def distance
    "#{@distance} miles"
  end
end
