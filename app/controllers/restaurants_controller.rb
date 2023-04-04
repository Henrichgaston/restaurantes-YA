class RestaurantsController < ApplicationController
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

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    @restaurant.save
    if @restaurant.save
      redirect_to restaurants_path, notice: "El restaurante se creo exitosamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    redirect_to restaurants_path, status: :see_other
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :specialty, :description, :photo)
  end
end
