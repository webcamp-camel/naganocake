class CreateShipToAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_to_adresses do |t|

      t.timestamps
    end
  end
end
