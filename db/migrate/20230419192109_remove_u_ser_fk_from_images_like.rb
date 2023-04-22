class RemoveUSerFkFromImagesLike < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :images_likes, to_table: :users
  end
end
