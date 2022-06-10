require 'rails_helper'

RSpec.feature 'Display Courier Rates', type: :feature do
  let!(:lalamove) { create(:courier_rate, :lalamove) }
  let!(:grab) { create(:courier_rate, :grab) }
  let!(:jnt_express) { create(:courier_rate, :jnt_express) }
  let!(:lbc) { create(:courier_rate, :lbc) }
  let!(:philippines) { create(:country) }
  let!(:metro_manila) { create(:province, :metro_manila) }
  let!(:bulacan) { create(:province, :bulacan) }
  let!(:city1) { create(:city, :city1) }
  let!(:city2) { create(:city, :city2) }

  let!(:pickup_address) { create(:address, :pickup) }
  let!(:delivery_within) { create(:address, :delivery_within) }
  let!(:delivery_outside) { create(:address, :delivery_outside) }
  let!(:quote_within) { create(:shipment_quote, :within) }
  let!(:quote_outside) { create(:shipment_quote, :outside) }

  scenario 'Displays delivery rates within metro manila' do
    visit '/shipment_quotes/1'

    expect(page).to have_text('My Address')
    expect(page).to have_text('Metro Manila')
    expect(page).to have_text('Philippines')

    # TODO: For improvement to see if table row contains specific
    expect(page).to have_text('Lalamove')
    expect(page).to have_text('on-demand')
    expect(page).to have_text('Php 100')
    expect(page).to have_text('Grab')
    expect(page).to have_text('on-demand')
    expect(page).to have_text('Php 120')
    expect(page).to have_text('J&T Express')
    expect(page).to have_text('next-day')
    expect(page).to have_text('Php 80')
    expect(page).to have_text('LBC')
    expect(page).to have_text('next-day')
    expect(page).to have_text('Php 100')
  end

  scenario 'Displays delivery rates within metro manila' do
    visit '/shipment_quotes/2'

    expect(page).to have_text('My Address')
    expect(page).to have_text('Metro Manila')
    expect(page).to have_text('Philippines')

    expect(page).not_to have_text('Lalamove')
    expect(page).not_to have_text('Grab')
    expect(page).not_to have_text('on-demand')

    # TODO: For improvement to see if table row contains specific
    expect(page).to have_text('J&T Express')
    expect(page).to have_text('next-day')
    expect(page).to have_text('Php 100')
    expect(page).to have_text('LBC')
    expect(page).to have_text('next-day')
    expect(page).to have_text('Php 120')
  end
end
