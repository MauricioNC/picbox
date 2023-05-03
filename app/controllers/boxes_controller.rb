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

  def modal_boxes
    @boxes = Box.all

    respond_to do |format|
      format.html {}
      format.js
    end
  end

  def add_image
    image = Image.find_by_identifier(params[:image_identifier])
    box = Box.find_by_identifier(params[:box_identifier])

    if box && image
      if @current_user.boxes_images.create(image_id: image.id, box_id: box.id)
        render json: {response: true}
        return
      end
    end

    render json: {response: false}
  end

  def remove_image
    image = Image.find_by_identifier(params[:image_identifier])
    box = Box.find_by_identifier(params[:box_identifier])

    if box && image
      if @current_user.boxes_images.where(image_id: image.id, box_id: box.id).first.delete
        render json: {response: true}
        return
      end
    end

    render json: {response: false}
  end

  def image_in_box
    image = Image.find_by_identifier(params[:image_identifier])
    box = Box.find_by_identifier(params[:box_identifier])

    if image && box
      if BoxesImage.where(image_id: image.id).where(box_id: box.id).empty?
        render json: {response: false}
        return
      end
    end

    render json: {response: true}
  end

  def show_images_in_box
    box = Box.find_by_identifier(params[:identifier])
    img_ids = BoxesImage.where(box_id: box.id).map { |item| item.image_id }

    @images = Image.where(id: img_ids) if box
  end

  private

  def box_params
    params.require(:box).permit(:box_name, :description, tag_ids: [])
  end

end
