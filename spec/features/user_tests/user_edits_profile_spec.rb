require 'rails_helper'

feature 'user edits profile', %{
  As a registered user,
  I want to edit my profile
  So that my information can be updated
} do

  scenario 'user navigates to edit page' do
    user = FactoryGirl.create(:user)

    visit food_trucks_path

    click_link('Sign In')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    click_link('My Account')

    click_link('Edit Profile')

    expect(page).to have_content('Edit User')
    expect(page).to have_content('(we need your
    current password to confirm your changes)')
    expect(page).to have_content('Cancel my account')

    fill_in 'Email', with: 'derp@gmail.com'
    fill_in 'Password', with: 'nicepassword'
    fill_in 'Password confirmation', with: 'nicepassword'
    fill_in 'Current password', with: user.password

    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully.')

  end
end
