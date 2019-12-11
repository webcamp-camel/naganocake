class RemoveShipNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :ship_name, :string
  end
end
