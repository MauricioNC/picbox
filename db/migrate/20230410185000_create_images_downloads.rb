class CreateImagesDownloads < ActiveRecord::Migration[6.1]
  def change
    create_table :images_downloads do |t|
      t.references :image, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
