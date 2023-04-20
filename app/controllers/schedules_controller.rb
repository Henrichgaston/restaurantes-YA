class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:new, :create]
  before_action :set_id_schedule, only: [:show, :update, :edit]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.restaurant_id = @restaurant.id
    if @schedule.save
      redirect_to restaurants_path, notice: "El restaurante se creo exitosamente"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path, status: :see_other
  end

  private

  def schedule_params
    params.require(:schedule).permit(:day, :open_at, :close_at)
  end

  def set_schedule
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_id_schedule
    @schedule = Schedule.find(params[:id])
  end
end
