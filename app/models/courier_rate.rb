class CourierRate < ApplicationRecord
  scope :details, -> { select(:id, :name, :within_metro_manila, :outside_metro_manila, :delivery_option) }
  enum delivery_option: %i[on-demand next-day]
  validates :name, presence: true
  validates :within_metro_manila, numericality: true
  validates :outside_metro_manila, numericality: true

  def self.attributes
    details.map do |courier|
      courier.attributes.symbolize_keys
    end
  end
end
