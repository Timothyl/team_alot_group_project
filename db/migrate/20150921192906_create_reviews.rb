class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :header, null: false
      t.string :body, null: false
      t.integer :rating, null: false

      t.timestamps null: false
      t.belongs_to :user
      t.belongs_to :food_truck
    end
  end
end
