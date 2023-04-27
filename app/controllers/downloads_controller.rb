class DownloadsController < ApplicationController
  before_action :authorized

  def show
    downloads = ImagesDownload.where(user_id: @current_user.id)
    @images = Image.find(downloads.map { |img| img.image_id })
  end
end
