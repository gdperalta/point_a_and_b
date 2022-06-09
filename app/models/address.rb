class Address < ApplicationRecord
  enum address_type: %i[pickup delivery]
  has_many :shipment_quotes
end
