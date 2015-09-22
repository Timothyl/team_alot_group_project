require "rails_helper"

feature "user views show page and sees reviews", %{
  As a user
  I want to view a food truck's reviews
  So that I can determine where to eat
} do
  # Acceptance Criteria
  # * If a user goes to the show page, they see a list of food truck reviews.
  scenario "user navigates to a food truck's show page and sees reviews" do
    f = FactoryGirl.create(:food_truck)
    r = FactoryGirl.create(:review, food_truck: f)

    visit "/food_trucks/#{f.id}"
    expect(page).to have_content("This is the body of the review. It's terribly interesting.")
  end
end
