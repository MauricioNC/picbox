class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title
      t.string :location
      t.string :identifier
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
