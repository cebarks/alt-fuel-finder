class SearchFacade
  def initialize(parameters)
    @zipcode = parameters
  end

  def stations
    service.stations.map do |json_station|
      Station.new(json_station)
    end
  end

  private

  def service
    @service ||= NRELService.new(ENV["NREL_API_KEY"])
  end
end
