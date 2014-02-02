class DaysController < ApplicationController

  # before_filter :check_if_logged_in

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
      redirect_to "sessions#new"
    end
  end

end