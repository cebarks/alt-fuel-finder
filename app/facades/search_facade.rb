class SearchFacade
  def initialize(zipcode)
    @zipcode = zipcode
  end

  def stations
    service.stations(@zipcode).map do |json_station|
      Station.new(json_station)
    end
  end

  private

  def service
    @service ||= NRELService.new(ENV["NREL_API_KEY"])
  end
end
