class BoxesController < ApplicationController
  before_action :authorized

  include ApplicationConcern

  def new
    @box = Box.new
    @tags = Tag.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @box = @current_user.boxes.build(box_params)

    if @box.save
      identifier = get_secure_identifier(12)
      GenerateIdentifierJob.perform_later(@box.id, identifier, "box")

      redirect_to show_boxes_path(@current_user.username), success: "Box created successfully"
    else
      redirect_to root_path, error: e.message, status: :unprocessable_entity
    end
  end

  def show
    @boxes = Box.where(user_id: @current_user.id)
  end

  private

  def box_params
    params.require(:box).permit(:box_name, :description, tag_ids: [])
  end

end
