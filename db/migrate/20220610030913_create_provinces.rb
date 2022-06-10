class CreateProvinces < ActiveRecord::Migration[6.1]
  def change
    create_table :provinces do |t|
      t.references :country, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
