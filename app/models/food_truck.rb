class FoodTruck < ActiveRecord::Base
  has_many :reviews
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { minimum: 20 }
  validates :description, length: { maximum: 200 }
  validates :avg_rating, presence: true
  validates :avg_rating, numericality: { only_integer: true }
end
