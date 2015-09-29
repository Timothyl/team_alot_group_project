require "rails_helper"

feature "Delete review from food truck", %{
  As a authenticated user/admin
  I want to delete a review from a food truck
  So that I can remove inappropriate content
} do
  # Acceptance Criteria
  # If a review is deemed inappropriate, the admin can
  # delete the review.

  scenario "admin deletes review from food truck" do
    review = FactoryGirl.create(:review)
    admin = FactoryGirl.create(:user, admin: true)

    visit "/"
    click_link('Sign In')

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    visit food_truck_path(review.food_truck)

    click_link "Delete review"

    expect(page).to_not have_content(review.header)
    expect(page).to_not have_content(review.body)
  end

  scenario "user deletes own review from food truck" do
    review = FactoryGirl.create(:review)
    user = review.user

    visit "/"
    click_link('Sign In')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit food_truck_path(review.food_truck)

    click_link "Delete review"

    expect(page).to_not have_content(review.header)
    expect(page).to_not have_content(review.body)
  end
end
