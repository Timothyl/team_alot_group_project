class Review < ActiveRecord::Base
  belongs_to :food_truck
  belongs_to :user

  validates :header, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 1..5 }
end
