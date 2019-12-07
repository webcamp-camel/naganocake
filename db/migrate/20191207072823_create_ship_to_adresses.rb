class CreateShipToAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_to_adresses do |t|
      t.string :name,         null: false
      t.string :postal_code,  null: false
      t.text :address,        null: false

      t.timestamps
    end
  end
end
