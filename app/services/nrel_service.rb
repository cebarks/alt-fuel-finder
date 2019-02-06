class NRELService
  def initialize(api_key)
    @api_key = api_key
  end

  def stations(zipcode)
    params = {
      location: zipcode,
      radius: 6,
      fuel_type: "ELEC,LPG",
      limit: 10
    }
    
    json = get_json("/api/alt-fuel-stations/v1/nearest.json", params)
    json[:fuel_stations]
  end

  private

  def get_json(path, **params)
    params[:api_key] = @api_key
    response = conn.get(path, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://developer.nrel.gov/")
  end
end
