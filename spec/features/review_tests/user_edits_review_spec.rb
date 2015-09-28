require "rails_helper"

feature "user edits a food truck review", %{
  As an authenticated user
  I want to edit my food truck review
  So that I can fix any mistakes I made
} do
  # Acceptance Criteria
  # If a user is logged in, they can edit their own reviews.

  scenario "user is logged in and edits their review", js: true do
    food_truck_review = FactoryGirl.create(:review)
    visit food_truck_path(food_truck_review.food_truck)
    click_button "Edit your review"

    fill_in "Header", with: "This is the test header!"
    fill_in "Body", with: "This is the test body. It's perfect for testing
    and it is the perfect length for it."
    fill_in "Rating", with: 3

    click_button "Submit Review"

    expect(page).to have_content("This is the test header!")
    expect(page).to have_content("This is the test body. It's perfect for testing
    and it is the perfect length for it.")
    expect(page).to have_content("3")
  end
end
