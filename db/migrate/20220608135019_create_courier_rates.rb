class CreateCourierRates < ActiveRecord::Migration[6.1]
  def change
    create_table :courier_rates do |t|
      t.string :name
      t.integer :within_metro_manila
      t.integer :outside_metro_manila
      t.integer :delivery_option

      t.timestamps
    end
  end
end
