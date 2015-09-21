require "rails_helper"

feature "user views show page", %{
  As a user
  I want to view a food truck's information
  so that I can learn more about it
} do
  # Acceptance Criteria
  # * If a user goes to the index page, they see a list of food trucks.

  scenario "user views show page of a food truck" do
    a = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )

    visit "/"
    expect(page).to have_content("Chicken & Rice Guys")
    expect(page).to have_content("4")

    click_link("#{a.name}")
    expect(page).to have_content("Chicken & Rice Guys")
    expect(page).to have_content("Food truck that specializes in chicken and lamb shawarma.")
    expect(page).to have_content("4")
    expect(page).to have_content("Harvard Square")

  end
end
