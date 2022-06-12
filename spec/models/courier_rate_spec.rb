require 'rails_helper'

RSpec.describe CourierRate, type: :model do
  context 'methods' do
    let!(:lalamove) { create(:courier_rate, :lalamove) }
    let!(:grab) { create(:courier_rate, :grab) }
    let!(:jnt_express) { create(:courier_rate, :jnt_express) }
    let!(:lbc) { create(:courier_rate, :lbc) }

    context '#attributes' do
      it 'mutates the collection of couriers into a hash and symbolizes the keys' do
        expect(CourierRate.attributes).to include({ id: 1, name: 'Lalamove', delivery_option: 'on-demand',
                                                    within_metro_manila: 100, outside_metro_manila: nil })
        expect(CourierRate.attributes).to include({ id: 2, name: 'Grab', delivery_option: 'on-demand',
                                                    within_metro_manila: 120, outside_metro_manila: nil })
        expect(CourierRate.attributes).to include({ id: 3, name: 'J&T Express', delivery_option: 'next-day',
                                                    within_metro_manila: 80, outside_metro_manila: 100 })
        expect(CourierRate.attributes).to include({ id: 4, name: 'LBC', delivery_option: 'next-day',
                                                    within_metro_manila: 100, outside_metro_manila: 120 })
      end
    end

    context 'validations' do
      let(:courier_rate) { build(:courier_rate, :lalamove) }

      it 'is valid with valid attributes' do
        expect(courier_rate).to be_valid
      end

      context 'name' do
        it 'is invalid if blank' do
          courier_rate.name = ''
          expect(courier_rate).to_not be_valid
          expect(courier_rate.errors.to_hash.keys).to include(:name)
          expect(courier_rate.errors[:name]).to include("can't be blank")
        end
      end

      context 'within_metro_manila' do
        it 'is invalid if it is not a number' do
          courier_rate.within_metro_manila = 'One hundred'
          expect(courier_rate).to_not be_valid
          expect(courier_rate.errors.to_hash.keys).to include(:within_metro_manila)
          expect(courier_rate.errors[:within_metro_manila]).to include('is not a number')
        end
      end

      context 'outside_metro_manila' do
        it 'is invalid if city is not included in city list' do
          courier_rate.outside_metro_manila = 'Two hundred'
          expect(courier_rate).to_not be_valid
          expect(courier_rate.errors.to_hash.keys).to include(:outside_metro_manila)
          expect(courier_rate.errors[:outside_metro_manila]).to include('is not a number')
        end
      end
    end
  end
end
