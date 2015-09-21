require 'rails_helper'

describe FoodTruck do
  it { should have_many(:reviews) }
end
