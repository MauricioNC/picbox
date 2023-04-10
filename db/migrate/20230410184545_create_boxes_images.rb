class CreateBoxesImages < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes_images do |t|
      t.string :box_id
      t.string :image_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
