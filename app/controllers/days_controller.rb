class DaysController < ApplicationController

  before_filter :check_if_logged_in

  def create
    current_user.calendar.days.build(day_params)
    current_user.calendar.save!
    redirect_to calendar_path
  end

  def show
    @day = Day.find(params[:id])
  end

  def edit
    
  end

  def update
    
  end

  private

  def check_if_logged_in
    unless logged_in?
      redirect_to login_path
    end
  end

  def day_params
    params.require(:day).permit(:date, :savings, :beer, :wine, :liquor, :comment, :calendar_id)
  end

end