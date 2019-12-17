class RemoveShipStatusFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :ship_status, :integer
  end
end
