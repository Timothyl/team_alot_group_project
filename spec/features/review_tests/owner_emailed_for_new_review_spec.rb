require "rails_helper"

feature "owner receives email for new review", %{
  As the owner of a created food truck
  I want to receive an email when my truck is reviewed
  So that I know what users think of it
} do
  # Acceptance Criteria
  # If a food truck is reviewed, the creator of the food truck
  # will be emailed.

  scenario "food truck entry owner is emailed when new review is posted" do
    owner = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)
    truck.user = owner
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit food_truck_path(truck)

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
  end
end
