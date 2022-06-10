class Address < ApplicationRecord
  enum address_type: %i[pickup delivery]
  has_many :shipment_quotes
  belongs_to :city
  validates :address1, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true

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
