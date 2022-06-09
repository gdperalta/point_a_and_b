class AddAddressTypeToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :address_type, :integer
  end
end
