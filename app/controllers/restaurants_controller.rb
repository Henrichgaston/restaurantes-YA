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

end
