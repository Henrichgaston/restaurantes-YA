class FoodsController < ApplicationController
  def show
    @foods = Food.find(params[:id])
  end
  def index
    @foods = Food.all
  end
  def new
    @foods = Food.new
  end
end
