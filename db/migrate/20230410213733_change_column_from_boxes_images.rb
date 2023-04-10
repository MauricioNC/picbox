class ChangeColumnFromBoxesImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :boxes_images, :image_id
    remove_column :boxes_images, :box_id
    add_column :boxes_images, :image_id, :bigint, null: false
    add_column :boxes_images, :box_id, :bigint, null: false
  end
end
