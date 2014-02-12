module SessionsHelper

  def logged_in?
    !!session[:user_id]
  end

  def set_current_user user
    session[:user_id] = user.id
  end

  def clear_current_user
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
  
end