class AddOrderIdToOrderedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_items, :order_id, :integer
  end
end
