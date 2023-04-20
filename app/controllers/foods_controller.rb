class FoodsController < ApplicationController
  before_action :set_food, only: [:new, :create]
  before_action :set_id_food, only: [:show, :edit, :update, :destroy]
  def index
    @foods = Food.all
    # @foods = current_user.foods.order(:created_at)
  end

  def show
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.restaurant_id = @restaurant.id
    if @food.save
      redirect_to foods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @food.update(food_params)
      redirect_to foods_path, notice: "Comida actualizada correctamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy
    redirect_to foods_path, status: :see_other
  end

  private

  def food_params
    params.require(:food).permit(:name, :description, :price)
  end

  def set_food
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_id_food
    @food = Food.find(params[:id])
  end

end
