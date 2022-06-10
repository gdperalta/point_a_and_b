class Country < ApplicationRecord
  has_many :provinces
  validates :name, presence: true
end
