class AddPriceToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :price, :integer
  end
end
