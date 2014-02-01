class CalendarsController < ApplicationController

  def index
    
  end

  def show
    if logged_in?
    else
      redirect_to :root
    end
  end

end