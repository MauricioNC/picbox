class ApplicationController < ActionController::Base
  before_action :set_user

  add_flash_types :success, :error, :notice

  def logged_in?
    !!session[:user_id].nil?
  end

  def authorized
    redirect_to login_path if logged_in?
  end

  def set_user
    @current_user ||= User.find(session[:user_id]) unless logged_in?()
  end
end
