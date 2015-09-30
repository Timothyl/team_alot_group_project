class Review < ActiveRecord::Base
  paginates_per 4
  has_many :votes
  belongs_to :food_truck
  belongs_to :user
  validates :header, presence: true
  validates :body, presence: true
  validates :body, length: { minimum: 30 }
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5, message: " must be between 1 to 5" }

  def upvotes_score
    upvotes = votes.where(upvote: 1).count
    if upvotes.nil?
      return 0
    else
      return upvotes
    end
  end

  def downvotes_score
    downvotes = votes.where(downvote: 1).count
    if downvotes.nil?
      return 0
    else
      return downvotes
    end
  end

  def score
    self.upvotes_score - self.downvotes_score
  end
end
