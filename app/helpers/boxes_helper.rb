module BoxesHelper
  def get_boxes_count
    @current_user.boxes.count
  end
end
