class RemoveTotalPriceFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :total_price, :integer
  end
end
