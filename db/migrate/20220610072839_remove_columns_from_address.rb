class RemoveColumnsFromAddress < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :country, :string
    remove_column :addresses, :province, :string
    remove_column :addresses, :city, :string
  end
end
