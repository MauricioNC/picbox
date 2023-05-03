module LikesHelper
  def get_likes_count
    ImagesLike.where(user_id: @current_user.id).count
  end
end
