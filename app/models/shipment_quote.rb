class ShipmentQuote < ApplicationRecord
  belongs_to :pickup_address, class_name: 'Address'
  belongs_to :delivery_address, class_name: 'Address'
  accepts_nested_attributes_for :pickup_address
  accepts_nested_attributes_for :delivery_address

  def couriers
    CourierRate.attributes.select do |courier|
      courier[:rate] = courier_rate(courier)

      courier[:rate].present?
    end
  end

  private

  def courier_rate(courier)
    return unless pickup_address.province_name.upcase == 'METRO MANILA'

    if pickup_address.province_name == delivery_address.province_name
      courier[:within_metro_manila]
    else
      courier[:outside_metro_manila]
    end
  end
end
