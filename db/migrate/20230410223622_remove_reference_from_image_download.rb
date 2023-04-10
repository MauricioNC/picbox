class RemoveReferenceFromImageDownload < ActiveRecord::Migration[6.1]
  def change
    remove_column :images_downloads, :image_id
  end
end
