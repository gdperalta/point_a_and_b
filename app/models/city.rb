class City < ApplicationRecord
  scope :find_by_province, ->(province_id) { where('province_id = ?', province_id) }
  has_many :addresses
  belongs_to :province
  validates :name, presence: true
end
