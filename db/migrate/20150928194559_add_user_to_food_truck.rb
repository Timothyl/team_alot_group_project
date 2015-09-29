class AddUserToFoodTruck < ActiveRecord::Migration
  def change
    add_column :food_trucks, :user_id, :integer
  end
end
