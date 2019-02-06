require 'rails_helper'

describe SearchFacade do
  describe "#stations" do
    it "returns an array of station objects sorted by distance" do
      VCR.use_cassette("nrel-facade") do
        facade = SearchFacade.new("80211")

        stations = facade.stations
        expect(stations.length).to eq(10)
        stations.each do |station|
          expect(station).to be_instance_of(Station)
        end
      end
    end
  end
end
