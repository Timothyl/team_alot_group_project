require "rails_helper"

feature "user upvotes a food truck review", %{
  As an authenticated user
  I want to upvote a food truck review
  So that I can give implicit approval
} do
  # Acceptance Criteria
  # If a user is logged in, they can edit vote on reviews.

  scenario "user is NOT logged in and tries voting on a review", js: true do
    food_truck_review = FactoryGirl.create(:review)
    visit food_truck_path(food_truck_review.food_truck)
    page.find("#novoteforyou").click
    expect(page).to have_content("Log in")
    expect(page).to have_content("Forgot your password?")
    expect(page).to_not have_content("Score: 1")
  end

  scenario "user is logged in, can see a review to vote on", js: true do
    user = FactoryGirl.create(:user)
    food_truck_review = FactoryGirl.create(:review, user: user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit food_truck_path(food_truck_review.food_truck)
    expect(page).to have_content(food_truck_review.body)
  end

  context 'tests that need before each' do
    before :each do
      user = FactoryGirl.create(:user)
      food_truck_review = FactoryGirl.create(:review, user: user)
      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
      visit food_truck_path(food_truck_review.food_truck)
    end

    scenario "user is logged in and upvotes a review", js: true do
      page.find("#upvote").click
      expect(page).to have_content("1")
    end

    scenario "user is logged in and downvotes a review", js: true do
      page.find("#downvote").click
      expect(page).to have_content("-1")
    end

    scenario "user regrets their decision, changes vote", js: true do
      page.find("#upvote").click
      page.find("#downvote").click
      expect(page).to have_content("-1")
    end

    scenario "indecisive user undoes their vote", js: true do
      page.find("#upvote").click
      page.find("#upvote").click
      expect(page).to have_content("0")
    end
  end
end
