class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      set_current_user @user
      redirect_to calendar_path(@user.calendar)
    else
      flash[:error] = "Incorrect Email or Password"
      render :new
    end
  end

  def destroy
    clear_current_user
    redirect_to login_path
  end
  
end