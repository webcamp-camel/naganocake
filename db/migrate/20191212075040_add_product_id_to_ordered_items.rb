class AddProductIdToOrderedItems < ActiveRecord::Migration[5.2]
  def change
    add_column :ordered_items, :product_id, :integer
  end
end
