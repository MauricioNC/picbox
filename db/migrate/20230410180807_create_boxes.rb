class CreateBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes do |t|
      t.string :box_name
      t.string :description
      t.string :identifier
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
