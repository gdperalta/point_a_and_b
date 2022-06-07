class ShipmentQuote < ApplicationRecord
  has_one :pickup_address
  has_one :delivery_address
end
