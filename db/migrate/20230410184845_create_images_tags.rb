class CreateImagesTags < ActiveRecord::Migration[6.1]
  def change
    create_table :images_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
