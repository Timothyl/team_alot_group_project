class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, uniqueness: { scope: :review }
  validates :upvote, presence: true
  validates :downvote, presence: true
  validates :upvote, numericality: { only_integer: true }
  validates :downvote, numericality: { only_integer: true }
  # between 1 and 0
end
