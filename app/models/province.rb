class Province < ApplicationRecord
  scope :find_by_country, ->(country_id) { where('country_id = ?', country_id) }
  belongs_to :country
  has_many :cities
  validates :name, presence: true
end
