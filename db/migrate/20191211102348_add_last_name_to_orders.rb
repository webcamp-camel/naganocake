class AddLastNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :last_name, :string
    add_column :orders, :first_name, :string
    add_column :orders, :last_name_kana, :string
    add_column :orders, :first_name_kana, :string
  end
end
