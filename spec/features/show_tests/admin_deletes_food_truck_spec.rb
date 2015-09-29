require "rails_helper"

feature "admin deletes a food truck", %{
  As an administrator
  I want to delete a food truck
  To remove inappropriate information
} do

  scenario "admin deletes a food truck" do
    admin = FactoryGirl.create(:user, admin: true)
    food_truck = FactoryGirl.create(:food_truck)

    visit "/"
    click_link('Sign In')

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_button 'Log in'

    visit food_truck_path(food_truck)

    click_link "Delete food truck"

    expect(page).to_not have_content(food_truck.name)
  end

end
