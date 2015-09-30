require "rails_helper"

describe Review do
  describe "table" do
    it { should have_db_column(:header).of_type(:string) }
    it { should have_db_column(:body).of_type(:string) }
    it { should have_db_column(:rating).of_type(:integer) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:food_truck_id).of_type(:integer) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:food_truck) }
  end

  describe "validations" do
    it { should validate_numericality_of(:rating) }
    it { should validate_inclusion_of(:rating).in_range(1..5).
                with_message(/ must be between 1 to 5/)}
    it { should validate_presence_of(:header) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:body).is_at_least(30) }
  end
end
