class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :password_confirm
      t.string :location
      t.string :phone_number
      t.boolean :is_admin

      t.timestamps
    end
  end
end
