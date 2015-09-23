require "rails_helper"

feature "user views show page and sees reviews", %{
  As a user
  I want to view a food truck's reviews
  So that I can determine where to eat
} do
  # Acceptance Criteria
  # * If a user goes to the show page, they see a list of food truck reviews.
  scenario "user navigates to a food truck's show page and sees reviews" do
    r = FactoryGirl.create(:review)
    visit food_truck_path(r.food_truck)
    expect(page).to have_content(r.body)
  end
end
