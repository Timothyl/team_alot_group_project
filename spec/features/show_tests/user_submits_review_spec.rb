require "rails_helper"

feature "user submits a food truck review", %{
  As a user
  I want to submit a review
  So that I can evaluate a food truck
} do

  scenario "authenticated user makes the form appear" do
    sample_food_truck_1 = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes
      in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )
    user = FactoryGirl.create(:user)

    visit food_trucks_path

    click_link('Sign In')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit food_truck_path(sample_food_truck_1)

    expect(page).to have_content("Submit Your Review")

    click_button("Submit Your Review")

    expect(page).to have_content("Header")
    expect(page).to have_content("Body")
    expect(page).to have_content("Rating")
  end

  scenario "authenticated user submits review" do
    sample_food_truck_1 = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes
      in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )
    user = FactoryGirl.create(:user)

    visit food_trucks_path

    click_link('Sign In')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit food_truck_path(sample_food_truck_1)

    expect(page).to have_content("Submit Your Review")

    click_button('Submit Your Review')

    expect(page).to have_content("Header")
    expect(page).to have_content("Body")
    expect(page).to have_content("Rating")

    fill_in "Header", with: 'blahblahblah'
    fill_in "Body", with: 'such food much good
    such food much good such food much
    good such food much good such food much good'
    fill_in "Rating", with: '1'

    click_button('Submit Review')

    expect(page).to have_content("New Review Added")

    expect(page).to have_content('blahblahblah')
  end

  scenario 'unregistered user submits a form' do
    sample_food_truck_1 = FoodTruck.create(
      name: "Chicken & Rice Guys",
      description: "Food truck that specializes
      in chicken and lamb shawarma.",
      avg_rating: 4,
      location: "Harvard Square"
    )

    visit food_trucks_path

    visit food_truck_path(sample_food_truck_1)

    expect(page).to have_content("Submit Your Review")

    click_on('Submit Your Review')

    expect(page).to have_content("Log in")

  end
end
