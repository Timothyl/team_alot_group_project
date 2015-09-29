require 'rails_helper'

feature 'registered user submits new food truck', %{
  As a registered user,
  I want to submit a form
  So that I can add a new food truck
} do

  scenario 'authenticated user navigates to form and submits' do
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign Out')

    click_link('Submit New Food Truck')

    expect(page).to have_content('Add a New Food Truck')
    expect(page).to have_content('Name')
    expect(page).to have_content('Avg rating')
    expect(page).to have_content('Description')
    expect(page).to have_content('Location')
    expect(page).to have_button('Add Food Truck')

    fill_in 'Name', with: 'foodtruck1'
    fill_in 'Avg rating', with: 3
    fill_in 'Description', with: 'much food such truck wow doge
    kek lel wtf grep grop rake spec pppp'
    fill_in 'Location', with: 'Behind you'

    click_button('Add Food Truck')

    expect(page).to have_content('foodtruck1')
    expect(page).to have_content(3)
    expect(page).to have_content('much food such truck wow doge
    kek lel wtf grep grop rake spec pppp')
    expect(page).to have_content('Behind you')
  end

  scenario 'unregistered user navigates to form' do

    visit food_trucks_path
    click_link('Submit New Food Truck')

    expect(page).to have_content('Log in')
    expect(page).to have_content('Forgot your password?')
  end

  scenario 'registered user submits invalid form' do
    user = FactoryGirl.create(:user)

    visit food_trucks_path
    click_link('Submit New Food Truck')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    fill_in 'Name', with: 'foodtruck1'
    fill_in 'Avg rating', with: 3
    fill_in 'Description', with: 'I am invalid'
    fill_in 'Location', with: 'Behind you'

    click_button('Add Food Truck')

    expect(page).to have_content('Description is too short
    (minimum is 20 characters)')
  end

end
