require "rails_helper"

describe FoodTruck do
  describe "table" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:avg_rating).of_type(:decimal) }
    it { should have_db_column(:location).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "associations" do
    it { should have_many(:reviews) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:avg_rating) }
    it { should validate_length_of(:name).is_at_most(30) }
    it { should validate_length_of(:description).is_at_least(20) }
    it { should validate_length_of(:description).is_at_most(200) }
    it { should validate_numericality_of(:avg_rating) }

    subject { FactoryGirl.create(:food_truck) }
    it { should validate_uniqueness_of(:name) }
  end
end
