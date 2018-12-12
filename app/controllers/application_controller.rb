class ApplicationController < ActionController::Base

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def chronic_time(string)
    Chronic.parse(string)
  end

end
