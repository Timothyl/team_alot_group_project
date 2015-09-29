require "rails_helper"

feature "user views", %{
  As a user
  I want to view a list of food trucks
  So that I can decide where to eat
} do
  # Acceptance Criteria
  # * If a user goes to the index page, they see a list of food trucks.

  scenario "user views index page" do
    sample_food_truck_1 = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )
    visit food_trucks_path
    expect(page).to have_content(sample_food_truck_1.name)
    expect(page).to have_content(sample_food_truck_1.avg_rating)
  end
end
