require 'rails_helper'

describe Station do
  it "works" do
    params = {
      station_name: "Test1",
      street_address: "666 Divine Lane",
      fuel_type_code: "ELEC",
      distance: "4",
      access_days_time: "24 Hour"
    }
    station = Station.new(params)

    expect(station.name).to eq(params[:station_name])
    expect(station.address).to eq(params[:street_address])
    expect(station.type).to eq("Electric")
    expect(station.distance).to eq("#{params[:distance]} miles")
    expect(station.access_times).to eq(params[:access_days_time])
  end
end
