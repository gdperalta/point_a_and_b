require 'rails_helper'

RSpec.describe ShipmentQuote, type: :model do
  let!(:lalamove) { create(:courier_rate, :lalamove) }
  let!(:grab) { create(:courier_rate, :grab) }
  let!(:jnt_express) { create(:courier_rate, :jnt_express) }
  let!(:lbc) { create(:courier_rate, :lbc) }

  let!(:country) { create(:country, :ph) }
  let!(:metro_manila) { create(:province, :metro_manila) }
  let!(:bulacan) { create(:province, :bulacan) }
  let!(:city1) { create(:city, :city1) }
  let!(:city2) { create(:city, :city2) }
  let!(:pickup_address) { create(:address, :pickup) }
  let!(:delivery_within) { create(:address, :delivery_within) }
  let!(:delivery_outside) { create(:address, :delivery_outside) }

  context 'methods' do
    context '#couriers' do
      context 'within metro manila' do
        it 'returns the rates for shipments within metro manila' do
          quote_within = create(:shipment_quote, :within)
          lalamove, grab, jnt_express, lbc = quote_within.couriers
          expect(lalamove).to include({ rate: 100 })
          expect(grab).to include({ rate: 120 })
          expect(jnt_express).to include({ rate: 80 })
          expect(lbc).to include({ rate: 100 })
        end
      end

      context 'outside metro manila' do
        it 'returns the rates for shipments outside metro manila' do
          quote_outside = create(:shipment_quote, :outside)
          lalamove, grab, jnt_express, lbc = quote_outside.couriers

          expect(lalamove).to include({ rate: nil })
          expect(grab).to include({ rate: nil })
          expect(jnt_express).to include({ rate: 100 })
          expect(lbc).to include({ rate: 120 })
        end
      end
    end
  end

  context 'validations' do
    let(:quote_within) { build(:shipment_quote, :within) }
    let(:quote_outside) { build(:shipment_quote, :outside) }
    it 'is valid with valid attributes' do
      expect(quote_within).to be_valid
    end
  end
end
