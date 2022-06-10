class AddDefaultToColumnsForProvince < ActiveRecord::Migration[6.1]
  def change
    change_column_default :provinces, :created_at, from: nil, to: -> { 'CURRENT_TIMESTAMP' }
    change_column_default :provinces, :updated_at, from: nil, to: -> { 'CURRENT_TIMESTAMP' }
  end
end
