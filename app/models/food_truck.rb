class FoodTruck < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validates :name, uniqueness: true
  validates :description, presence: true
  validates :description, length: { minimum: 20 }
  validates :description, length: { maximum: 200 }
  validates :avg_rating, presence: true
  validates :avg_rating, numericality: { only_integer: true }

  def self.search(query)
    where("name ilike ?", "%#{query}%")
  end

  def self.avg_rating(food_truck)
    food_truck_reviews = food_truck.reviews
    if food_truck_reviews.length == 0
      return 0
    else
      sum = food_truck_reviews.inject(0) { |sum, review| sum + review.rating }
    end
    average = sum.to_f / food_truck_reviews.length
    food_truck.avg_rating = average
  end
end
