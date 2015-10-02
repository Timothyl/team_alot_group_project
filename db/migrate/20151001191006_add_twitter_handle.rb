class AddTwitterHandle < ActiveRecord::Migration
  def change
    add_column :food_trucks, :twitter, :string
  end
end
