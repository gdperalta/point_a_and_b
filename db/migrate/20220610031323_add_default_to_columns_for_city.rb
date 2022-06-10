class AddDefaultToColumnsForCity < ActiveRecord::Migration[6.1]
  def change
    change_column_default :cities, :created_at, from: nil, to: -> { 'CURRENT_TIMESTAMP' }
    change_column_default :cities, :updated_at, from: nil, to: -> { 'CURRENT_TIMESTAMP' }
  end
end
