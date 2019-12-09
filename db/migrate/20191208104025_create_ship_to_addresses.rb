class CreateShipToAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :ship_to_addresses do |t|
      t.string :last_name,       null: false
      t.string :first_name,      null: false
      t.string :last_name_kana,  null: false
      t.string :first_name_kana, null: false
      t.string :phone,           null: false
      t.string :postal_code,     null: false
      t.text :address,           null: false
      t.timestamps
    end
  end
end
