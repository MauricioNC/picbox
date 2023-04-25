class ChangePassowrdConfirmToPasswordConfirmationInUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password_confirm
    add_column :users, :password_confirmation, :string
  end
end
