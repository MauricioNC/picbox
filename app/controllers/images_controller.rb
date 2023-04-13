class ImagesController < ApplicationController
  before_action :set_user

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @image = @current_user.images.build(image_params)

    unless @image.save
      raise "Something went wrong posting your image, please try again."
    end

    respond_to do |format|
      format.html { redirect_to root_path, success: "Image poseted successfully" }
      format.js
    end

  rescue => ez
    render :new, error: e.message, status: :unprocessable_entity
  end

  private

  def image_params
    params.require(:image).permit(:title, :location)
  end
end
