class DownloadsController < ApplicationController
  before_action :authorized

  def show
    downloads = ImagesDownload.where(user_id: @current_user.id)
    @images = Image.find(downloads.map { |img| img.image_id })
  end

  def download
    image = Image.find_by_identifier(params[:image_identifier])

    if @current_user.images_downloads.where(image_id: image.id).first_or_create
      render json: { response: true }
      return
    end

    render json: { response: true }
  end
end
