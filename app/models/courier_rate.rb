class CourierRate < ApplicationRecord
  scope :details, -> { select(:id, :name, :within_metro_manila, :outside_metro_manila, :delivery_option) }
  enum delivery_option: %i[on-demand next-day]

  def self.attributes
    details.map do |courier|
      courier.attributes.symbolize_keys
    end
  end
end
