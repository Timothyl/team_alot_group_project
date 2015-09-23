require "rails_helper"

feature "only 4 reviews are shown at a time", %{
  As a user
  I only want to see 4 reviews at a time
  So that I am not overwhelmed
} do
  # Acceptance Criteria
  # *If there are four+ reviews, they'll only see the first four reviews.
  scenario "user navigates to a food truck's show page" do
    food_truck_review = FactoryGirl.create(:review)
    r1 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)
    r2 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)
    r3 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)
    r4 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)

    visit food_truck_path(food_truck_review.food_truck)
    expect(page).to have_content(food_truck_review.body)
    expect(page).to have_content(r1.body)
    expect(page).to have_content(r2.body)
    expect(page).to have_content(r3.body)
    expect(page).to_not have_content(r4.body)
  end

  scenario "user clicks next to see the next set of reviews" do
    food_truck_review = FactoryGirl.create(:review)
    r1 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)
    r2 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)
    r3 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)
    r4 = FactoryGirl.create(:review, food_truck: food_truck_review.food_truck)

    visit food_truck_path(food_truck_review.food_truck)
    click_link "Next"
    expect(page).to_not have_content(food_truck_review.body)
    expect(page).to_not have_content(r1.body)
    expect(page).to_not have_content(r2.body)
    expect(page).to_not have_content(r3.body)
    expect(page).to have_content(r4.body)
  end

end
