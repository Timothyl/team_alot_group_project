class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :user, uniqueness: { scope: :review }
  validates :upvote, presence: true
  validates :downvote, presence: true
  validates :upvote, numericality: { only_integer: true }
  validates :downvote, numericality: { only_integer: true }
  # between 1 and 0

  def destroy_if_exists(vote_type)
    if vote_type == "upvote"
      if self.upvote == 1
        self.destroy
        return nil
      else
        self
      end
    else
      if self.downvote == 1
        self.destroy
        return nil
      else
        self
      end
    end
  end

  def change_vote(vote_type)
    if vote_type == "upvote"
      self.upvote = 1
      self.downvote = 0
    elsif vote_type == "downvote"
      self.downvote = 1
      self.upvote = 0
    end
  end
end
