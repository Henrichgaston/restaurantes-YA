class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
    # si viene algo en el query que me muestre lo encontrado a partir del metodo creado en el modelo de restaurant. Caso contrario que me muestre todos
    if params[:query].present?
      @restaurants = Restaurant.search_all_restaurants(params[:query])
      if @restaurants.empty?
        @restaurants = Restaurant.all
        flash[:notice] = "No se econtraron restaurantes"
      end
    else
      @restaurants = Restaurant.all
    end
  end

  def show; end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    if @restaurant.save
      redirect_to my_restaurants_path, notice: "El restaurante se creo exitosamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to my_restaurants_path, notice: "El restaurante se actualizó exitosamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to my_restaurants_path, status: :see_other
  end

  def my_restaurants
    @restaurants = Restaurant.where(user_id: current_user.id)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :specialty, :description, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
