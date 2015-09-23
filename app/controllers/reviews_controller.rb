class ReviewsController < ApplicationController
  def new
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review.food_truck_id = @food_truck.id

    if @review.save
      redirect_to food_truck_path(@food_truck)
      flash[:success] = 'New Review Added'
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  protected
  def review_params
    params.require(:review).permit(:header, :body,
                                   :rating)
  end
end
