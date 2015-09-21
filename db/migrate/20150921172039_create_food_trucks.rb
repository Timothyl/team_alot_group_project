class CreateFoodTrucks < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :avg_rating
      t.string :location

      t.timestamps null: false
      t.index :name, unique: true
    end
  end
end
