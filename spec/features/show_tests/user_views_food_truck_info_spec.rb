require "rails_helper"

feature "user views show page", %{
  As a user
  I want to view a food truck's information
  So that I can learn more about it
} do
  # Acceptance Criteria
  # * If a user goes to the show page, they see a list of food trucks.
  scenario "user navigates to a food truck's show page" do
    sample_food_truck_1 = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )

    r1 = FactoryGirl.create(:review, food_truck: sample_food_truck_1)
    r2 = FactoryGirl.create(:review, food_truck: sample_food_truck_1)
    r3 = FactoryGirl.create(:review, food_truck: sample_food_truck_1)
    r4 = FactoryGirl.create(:review, food_truck: sample_food_truck_1)

    average = (r1.rating + r2.rating + r3.rating + r4.rating) / 4.0

    visit food_truck_path(sample_food_truck_1)
    expect(page).to have_content(sample_food_truck_1.name)
    expect(page).to have_content(average)
  end

  scenario "user clicks show page link" do
    sample_food_truck_1 = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )
    visit food_trucks_path
    click_link(sample_food_truck_1.name)
    expect(current_path).to eq(food_truck_path(sample_food_truck_1))
  end

  scenario "user views show page of a food truck" do
    sample_food_truck_1 = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )

    visit food_truck_path(sample_food_truck_1)
    expect(page).to have_content(sample_food_truck_1.name)
    expect(page).to have_content(sample_food_truck_1.description)
    expect(page).to have_content(sample_food_truck_1.avg_rating)
    expect(page).to have_content(sample_food_truck_1.location)
  end
end
