class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :review, null: false
      t.belongs_to :user, null: false
      t.integer :upvote, null: false
      t.integer :downvote, null: false
    end
  end
end
