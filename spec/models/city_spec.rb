require 'rails_helper'

RSpec.describe City, type: :model do
  let!(:country) { create(:country, :ph) }
  let!(:province) { create(:province, :metro_manila) }
  let(:city) { build(:city, :city1) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(city).to be_valid
    end
  end

  context 'address1' do
    it 'is invalid if blank' do
      city.name = ''
      expect(city).to_not be_valid
      expect(city.errors.to_hash.keys).to include(:name)
      expect(city.errors[:name]).to include("can't be blank")
    end
  end
end
