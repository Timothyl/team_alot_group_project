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
    truck = FactoryGirl.create(:food_truck, user: owner)
    

  end
