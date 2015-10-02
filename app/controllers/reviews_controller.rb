class ReviewsController < ApplicationController
  def new
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.new
  end

  def create
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.new(review_params)
    @review.food_truck_id = @food_truck.id
    @review.user = current_user
    if @review.save
      unless @food_truck.user == nil
        UserMailer.review_notification(
          @food_truck.user, current_user, @food_truck).deliver_now
      end
      FoodTruck.avg_rating(@food_truck)
      redirect_to food_truck_path(@food_truck)
      flash[:success] = 'New Review Added'
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      redirect_to food_truck_path(@food_truck)
    end
  end

  def edit
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.find(params[:id])
  end

  def update
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      flash[:notice] = "Review updated!"
      redirect_to food_truck_path(@food_truck)
    else
      flash[:notice] = "incorrect"
      redirect_to food_truck_path(@food_truck)
    end
  end

  def destroy
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted!"
    redirect_to food_truck_path(@food_truck)
  end

  protected

  def review_params
    params.require(:review).permit(:header, :body,
                                  :rating)
  end
end
