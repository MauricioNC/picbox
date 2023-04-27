class BoxesController < ApplicationController
  before_action :authorized

  def show
    @boxes = Box.where(user_id: @current_user.id)
  end
end
