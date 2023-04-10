class AddColumnToImageDwonload < ActiveRecord::Migration[6.1]
  def change
    add_column :images_downloads, :image_id, :bigint, null: false
  end
end
