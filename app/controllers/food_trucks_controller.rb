class FoodTrucksController < ApplicationController
  def index
    if params[:search]
      @food_trucks = FoodTruck.basic_search(params[:search]).order
      ("created_at DESC")
      if @food_trucks == []
        flash[:errors] = 'No food trucks found'
      else
        @food_trucks.each do |truck|
          FoodTruck.avg_rating(truck)
          unless truck.twitter == nil
            truck.latest_tweet = Twitter.find_tweets(truck.twitter, nil)
          end
        end
      end
    else
      @food_trucks = FoodTruck.all.order('created_at DESC')
      @food_trucks.each do |truck|
        FoodTruck.avg_rating(truck)
        unless truck.twitter == nil
          truck.latest_tweet = Twitter.find_tweets(truck.twitter, nil)
        end
      end
    end
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
    FoodTruck.avg_rating(@food_truck)
    @reviews = @food_truck.reviews.page params[:page]
    @review = Review.new

    if params[:search]
      @food_trucks = FoodTruck.basic_search(params[:search]).order
      ("created_at DESC")
      if @food_trucks == []
        flash[:errors] = 'No food trucks found'
      end
      render :index
    end


  end

  def new
    @food_truck = FoodTruck.new

    if params[:search]
      @food_trucks = FoodTruck.basic_search(params[:search]).order
      ("created_at DESC")
      if @food_trucks == []
        flash[:errors] = 'No food trucks found'
      end
      render :index
    end
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

    if params[:search]
      @food_trucks = FoodTruck.basic_search(params[:search]).order
      ("created_at DESC")
      if @food_trucks == []
        flash[:errors] = 'No food trucks found'
      end
      render :index
    end
  end

  def destroy
    @food_truck = FoodTruck.find(params[:id])
    @food_truck.destroy
    flash[:success] = "Food truck deleted!"
    redirect_to "/"
  end

  private

  def food_trucks_params
    params.require(:food_truck).permit(:name, :description, :avg_rating,
                                      :location, :twitter)
  end
end
