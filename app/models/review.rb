class Review < ActiveRecord::Base
  belongs_to :food_truck
  belongs_to :user

  validates :header, presence: true
  validates :body, presence: true
  validates :rating, presence: true, numericality: { only_integer: true }
  validates_inclusion_of :rating, :in => 1..5


end
