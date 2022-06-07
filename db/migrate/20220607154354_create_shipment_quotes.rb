class CreateShipmentQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :shipment_quotes do |t|
      t.references :pickup_address, null: false, foreign_key: { to_table: :addresses }
      t.references :delivery_address, null: false, foreign_key: { to_table: :addresses }
      t.timestamps
    end
  end
end
