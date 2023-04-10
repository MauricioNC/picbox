class CreateBoxesTags < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :box, null: false, foreign_key: true

      t.timestamps
    end
  end
end
