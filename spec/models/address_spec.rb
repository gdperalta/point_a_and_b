require 'rails_helper'

RSpec.describe Address, type: :model do
  let!(:country) { create(:country, :ph) }
  let!(:province) { create(:province, :metro_manila) }
  let!(:city) { create(:city, :city1) }
  let(:address) { build(:address, :pickup) }

  context 'methods' do
    let(:new_address) { create(:address, :pickup) }
    context '#city_name' do
      it 'returns the address city name' do
        expect(new_address.city_name).to eq('City 1')
      end
    end

    context '#province_name' do
      it 'returns the address city name' do
        expect(new_address.province_name).to eq('Metro Manila')
      end
    end

    context '#country_name' do
      it 'returns the address city name' do
        expect(new_address.country_name).to eq('Philippines')
      end
    end
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(address).to be_valid
    end

    context 'address1' do
      it 'is invalid if blank' do
        address.address1 = ''
        expect(address).to_not be_valid
        expect(address.errors.to_hash.keys).to include(:address1)
        expect(address.errors[:address1]).to include("can't be blank")
      end
    end

    context 'zip_code' do
      it 'is invalid if length is not 4' do
        address.zip_code = '123'
        expect(address).to_not be_valid
        expect(address.errors.to_hash.keys).to include(:zip_code)
        expect(address.errors[:zip_code]).to include('is the wrong length (should be 4 characters)')
      end
    end

    context 'city_id' do
      it 'is invalid if city is not included in city list' do
        address.city_id = 2
        expect(address).to_not be_valid
        expect(address.errors.to_hash.keys).to include(:city)
        expect(address.errors[:city]).to include('must exist')
      end

      it 'is invalid if city is not in the Philippines' do
        create(:country, :mal)
        create(:province, :outside_ph)
        create(:city, :city_outside_ph)
        invalid_address = build(:address, :outside_ph)

        expect(invalid_address).to_not be_valid
        expect(invalid_address.errors.to_hash.keys).to include(:city_id)
        expect(invalid_address.errors[:city_id]).to include('is not yet available for deliveries.')
      end
    end
  end
end
