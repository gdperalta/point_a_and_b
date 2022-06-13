class Address < ApplicationRecord
  enum address_type: %i[pickup delivery]
  has_many :shipment_quotes
  belongs_to :city
  validates :address1, presence: true
  validates :zip_code, presence: true, length: { is: 4 }
  validate :verify_country

  def verify_country
    return if city.nil? || country_name.upcase == 'PHILIPPINES'

    errors.add(:city_id, 'is not yet available for deliveries.')
  end

  def city_name
    city.name
  end

  def province_name
    city.province.name
  end

  def country_name
    city.province.country.name
  end
end
