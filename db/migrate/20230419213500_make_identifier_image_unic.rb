class MakeIdentifierImageUnic < ActiveRecord::Migration[6.1]
  def change
    remove_column :images, :identifier, :string
    add_column :images, :identifier, :string, unique: true
  end
end
