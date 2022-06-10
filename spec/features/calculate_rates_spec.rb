require 'rails_helper'

RSpec.feature 'Calculate Courier Rates', type: :feature do
  let!(:lalamove) { create(:courier_rate, :lalamove) }
  let!(:grab) { create(:courier_rate, :grab) }
  let!(:jnt_express) { create(:courier_rate, :jnt_express) }
  let!(:lbc) { create(:courier_rate, :lbc) }
  let!(:philippines) { create(:country, :ph) }
  let!(:malaysia) { create(:country, :mal) }
  let!(:metro_manila) { create(:province, :metro_manila) }
  let!(:bulacan) { create(:province, :bulacan) }
  let!(:city1) { create(:city, :city1) }
  let!(:city2) { create(:city, :city2) }
  let!(:pickup_address) { create(:address, :pickup) }
  let!(:delivery_within) { create(:address, :delivery_within) }
  let!(:delivery_outside) { create(:address, :delivery_outside) }

  scenario 'Calculates rates for deliveries within metro manila' do
    visit '/shipment_quotes/new'

    select('Philippines', from: 'shipment_quote[pickup_address_attributes][countries]', visible: false)
    # select('Metro Manila', from: 'shipment_quote[pickup_address_attributes][provinces]')
    # select('Philippines', from: 'shipment_quote[delivery_address_attributes][countries]')
    # select('Metro Manila', from: 'shipment_quote[delivery_address_attributes][provinces]')

    click_button('Compute Rates')

    expect(page).to have_text('Lalamove')
  end
end
