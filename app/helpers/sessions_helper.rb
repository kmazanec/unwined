module SessionsHelper

  def logged_in?
    false
  end

  def set_current_user user
    session[:id] = user.id
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end
  
  
end