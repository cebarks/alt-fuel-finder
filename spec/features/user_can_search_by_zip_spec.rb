require 'rails_helper'

describe "As a user" do
  describe "When I visit '/' and fill in the search form and submit it" do
    it "I should see a list of the 10 closest stations within 6 miles sorted by distance" do
      visit root_path

      fill_in "q", with: "80203"

      click_on "Locate"

      expect(current_path).to eq(search_path)

      within "#stations" do
        expect(page).to have_css(".station", count: 10)

        within last ".station" do
          expect(page).to have_css(".station-name")
          expect(page).to have_css(".station-address")
          expect(page).to have_css(".station-type")
          expect(page).to have_css(".station-distance")
          expect(page).to have_css(".station-access-times")

          expect(".station-distance").to be < 6
        end
      end
    end
  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
