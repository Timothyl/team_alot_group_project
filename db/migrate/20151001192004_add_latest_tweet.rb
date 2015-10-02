class AddLatestTweet < ActiveRecord::Migration
  def change
    add_column :food_trucks, :latest_tweet, :json
  end
end
