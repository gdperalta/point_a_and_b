class Address < ApplicationRecord
  enum address_type: %i[pickup delivery]
  has_many :shipment_quotes
  belongs_to :city

  def city_name
    city.name
  end

  def province_name
    city.province.name
  end

  def country_name
    province.country.name
  end
end
