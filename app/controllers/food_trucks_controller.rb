class FoodTrucksController < ApplicationController
  def index
    @food_trucks = FoodTruck.all
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create
    @food_truck = FoodTruck.new(food_truck_params)

    if @food_truck.save
      redirect_to @food_truck
      flash[:success] = 'New Food Truck Added'
    else
      flash[:errors] = @food_truck.errors.full_messages.join(". ")
      render :new
    end
  end

  private

  def food_truck_params
    params.require(:food_truck).permit(:name, :description,
                                       :avg_rating, :location)
  end
end
