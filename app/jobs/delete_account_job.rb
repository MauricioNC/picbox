class DeleteAccountJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    if user
      self.delete_boxes(user)
      self.delete_images(user)
      user.delete
    end
  end

  def delete_images(user)
    user.images.map { |img| img.tags.delete_all }
    ImagesLike.where(user_id: user.id).delete_all
    ImagesDownload.where(user_id: user.id).delete_all
    Image.where(user_id: user.id).delete_all
  end

  def delete_boxes(user)
    BoxesImage.where(user_id: user.id).delete_all
    user.boxes.map { |bx| bx.tags.delete_all }
    user.boxes.map {|bx| bx.delete}
  end
end
