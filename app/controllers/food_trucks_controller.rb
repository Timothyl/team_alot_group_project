class FoodTrucksController < ApplicationController
  def index
    if params[:search]
      @food_trucks = FoodTruck.search(params[:search]).order("created_at DESC")
      if @food_trucks == []
        flash[:errors] = 'No food trucks found'
      end
    else
      @food_trucks = FoodTruck.all.order('created_at DESC')
      @food_trucks.each do |truck|
        FoodTruck.avg_rating(truck)
      end
    end
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    FoodTruck.avg_rating(@food_truck)
    @reviews = @food_truck.reviews.page params[:page]
    @review = Review.new
  end

  def new
    @food_truck = FoodTruck.new
  end

  def create
    food_truck_params['name']
    @food_truck = FoodTruck.new(food_truck_params)

    if @food_truck.save
      redirect_to @food_truck
      flash[:success] = 'New Food Truck Added'
    else
      flash[:errors] = @food_truck.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    @food_truck = FoodTruck.find(params[:id])
    @food_truck.destroy
    flash[:success] = "Food truck deleted!"
    redirect_to "/"
  end

  private

  def food_truck_params
    params.require(:food_truck).permit(:name, :description,
                                       :avg_rating, :location)
  end
end
