class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(default_params)
    @restaurant.save

    redirect_to restaurants_path
  end

  def edit
    set_restaurant
  end

  def update
    set_restaurant
    @restaurant.update(default_params)

    redirect_to task_path(@restaurant)
  end

  def destroy
    set_restaurant

    @restaurant.destroy


    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def default_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end

end
