class ImagesController < ApplicationController
  before_action :set_user

  include ImagesConcern

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

    unless @image.save
      raise "Something went wrong posting your image, please try again."
    end

    identifier = get_secure_identifier(12)
    GenerateImageIdentifierJob.perform_later(@image.id, identifier)

    respond_to do |format|
      format.html { redirect_to root_path, success: "Image poseted successfully" }
      format.js
    end

  rescue => e
    respond_to do |format|
      format.html { redirect_to root_path, error: e.message, status: :unprocessable_entity }
      format.js
    end
  end

  private

  def image_params
    params.require(:image).permit(:title, :location, :photo, tag_ids: [])
  end
end
