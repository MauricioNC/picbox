class LikesController < ApplicationController
  before_action :authorized, :set_user, :set_image

  def like
    @image.images_likes.create(user_id: @current_user.id)
  end

  def unlike
    ImagesLike.where(image_id: @image.id).where(user_id: @current_user.id).first.delete
  end

  def image_liked
    img_liked = ImagesLike.where(image_id: @image.id).where(user_id: @current_user.id).empty?
    render json: {img_liked: !img_liked}
  end

  def show
    likes = ImagesLike.where(user_id: @current_user.id)
    @images = Image.find(likes.map { |img| img.image_id })
  end

  private

  def set_image
    @image = Image.find_by_identifier(params[:image_liked])
  end
end
