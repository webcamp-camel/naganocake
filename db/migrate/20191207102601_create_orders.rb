class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

    	t.integer :user_id, null:false
    	t.integer :ship_status, default: 1
    	t.integer :payment, null:false
    	t.integer :postage, default: 800, null:false
    	t.text :ship_address, null:false
    	t.string :ship_postal_code
    	t.integer :deposit_status, default: 1

      t.timestamps null:false
    end
  end
end
