class RemoveLastNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name_kana, :string
    remove_column :users, :first_name_kana, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :phone, :string
    remove_column :users, :address, :text
  end
end
