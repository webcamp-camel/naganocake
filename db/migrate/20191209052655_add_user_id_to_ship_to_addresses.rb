class AddUserIdToShipToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :ship_to_addresses, :user_id, :integer
  end
end
