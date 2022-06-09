class CourierRate < ApplicationRecord
  enum delivery_option: %i[on-demand next-day]

  def outside_metro_manila_rate
    outside_metro_manila || 'N/A'
  end

  def within_metro_manila_rate
    within_metro_manila || 'N/A'
  end
end
