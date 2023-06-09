class ImagesController < ApplicationController
  before_action :authorized

  include ApplicationConcern

  def index
    @images = Image.all
    @boxes = Box.limit(20)
  end

  def new
    @image = Image.new
    @tags = Tag.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @image = @current_user.images.build(image_params)

    if @image.save
      identifier = get_secure_identifier(12)
      GenerateIdentifierJob.perform_later(@image.id, identifier, "image")

      redirect_to root_path, success: "Image poseted successfully"
    else
      redirect_to root_path, error: e.message, status: :unprocessable_entity
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :location, :photo, tag_ids: [])
  end
end
