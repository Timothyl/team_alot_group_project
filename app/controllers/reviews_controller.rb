class ReviewsController < ApplicationController
  def index
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @reviews = @food_truck.reviews
  end
end
