class Address < ApplicationRecord
  has_many :shipment_quotes
end
