class AddDefaultToColumnsForCountry < ActiveRecord::Migration[6.1]
  def change
    change_column_default :countries, :created_at, from: nil, to: -> { 'CURRENT_TIMESTAMP' }
    change_column_default :countries, :updated_at, from: nil, to: -> { 'CURRENT_TIMESTAMP' }
  end
end
