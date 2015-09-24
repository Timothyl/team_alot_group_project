require "rails_helper"

feature "user searches for food truck", %{
  As a user
  I want to search for food trucks on the site
  So that I can find a food truck faster
} do
  # Acceptance Criteria
  # * If a user searches for a food truck, they should see search results.
  scenario "user finds the food truck" do
    truck = FactoryGirl.create(:food_truck)
    visit food_trucks_path

    fill_in "search-field", with: truck.name
    click_button "Search"
    expect(page).to have_content(truck.name)
  end

  scenario "user sees error message if food truck not in database" do
    visit food_trucks_path

    fill_in "search-field", with: "abcd"
    click_button "Search"
    expect(page).to have_content("No food trucks found")
  end
end
