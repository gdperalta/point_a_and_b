require 'rails_helper'

RSpec.describe Country, type: :model do
  let!(:country) { build(:country, :ph) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(country).to be_valid
    end
  end

  context 'address1' do
    it 'is invalid if blank' do
      country.name = ''
      expect(country).to_not be_valid
      expect(country.errors.to_hash.keys).to include(:name)
      expect(country.errors[:name]).to include("can't be blank")
    end
  end
end
