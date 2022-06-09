class ShipmentQuote < ApplicationRecord
  belongs_to :pickup_address, class_name: 'Address'
  belongs_to :delivery_address, class_name: 'Address'
  accepts_nested_attributes_for :pickup_address
  accepts_nested_attributes_for :delivery_address

  def couriers
    CourierRate.all.map do |courier|
      courier_details = courier.attributes.symbolize_keys.slice(:name, :delivery_option)
      courier_details[:rate] = courier_rate(courier)

      courier_details
    end
  end

  def courier_rate(courier)
    return unless pickup_address.province.upcase == 'METRO MANILA'

    pickup_address.province == delivery_address.province ? courier.within_metro_manila : courier.outside_metro_manila
  end
end
