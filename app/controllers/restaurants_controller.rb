class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurants = Restaurant.all
    @restaurants = Restaurant.find(params[:id])
  end

  def new
    @restaurants = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = @restaurant.current_user.id
    if @restaurant.save
      redirect_to @restaurant, notice: "El restaurante se ha creado con éxito"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :specialty, :description, :image)
  end
end
