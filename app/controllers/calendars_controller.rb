class CalendarsController < ApplicationController

  def index
    
  end

  def show
    if logged_in?
      @calendar = Calendar.includes(:days).find(current_user.calendar_id)
      @day = Day.new
    else
      redirect_to :root
    end
  end

end