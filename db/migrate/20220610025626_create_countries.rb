class CreateCountries < ActiveRecord::Migration[6.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso3
      t.string :iso2
      t.string :phone_code
      t.string :currency
      t.string :currency_symbol

      t.timestamps
    end
  end
end
