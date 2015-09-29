class ChangeAvgRating < ActiveRecord::Migration
  def up
    change_column :food_trucks, :avg_rating, :decimal, precision: 2, scale: 1
  end

  def down
    change_column :food_trucks, :avg_rating, :integer
  end
end
