require 'factory_girl_rails'
require "factory_girl"

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :food_truck do
    sequence(:name) { |n| "foodtruck#{n}" }
    description "This is the description for this food truck"
    avg_rating 3
    location "On the street"
  end

  factory :review do
    sequence(:header) { |n| "review#{n}" }
    body "This is the body of the review. It's terribly interesting."
    rating 3

    food_truck
    user
  end
end
