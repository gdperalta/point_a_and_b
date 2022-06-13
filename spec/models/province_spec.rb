require 'rails_helper'

RSpec.describe Province, type: :model do
  let!(:country) { create(:country, :ph) }
  let(:province) { build(:province, :metro_manila) }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(province).to be_valid
    end
  end

  context 'address1' do
    it 'is invalid if blank' do
      province.name = ''
      expect(province).to_not be_valid
      expect(province.errors.to_hash.keys).to include(:name)
      expect(province.errors[:name]).to include("can't be blank")
    end
  end
end
