module ImagesHelper
  def get_images_count
    @current_user.images.count
  end
  
  def get_downloads_count
    @current_user.images_downloads.count
  end
end
