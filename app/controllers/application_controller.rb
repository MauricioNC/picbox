class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :notice

  def set_user
    @current_user = User.first
  end
end
