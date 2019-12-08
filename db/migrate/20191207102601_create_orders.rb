class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

    	t.integer :user_id, null:false
    	t.integer :ship_status, null:false
    	t.integer :payment, null:false
    	t.integer :total_price, null:false
    	t.integer :postage, default: 800, null:false
    	t.string :ship_name, null:false
    	t.text :ship_address, null:false
    	t.string :ship_postal_code, null:false
    	t.integer :deposit_status, null:false

      t.timestamps null:false
    end
  end
end
