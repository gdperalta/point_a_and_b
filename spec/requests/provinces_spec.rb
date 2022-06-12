require 'rails_helper'

RSpec.describe 'Provinces', type: :request do
  let!(:philippines) { create(:country, :ph) }
  let!(:malaysia) { create(:country, :mal) }
  let!(:metro_manila) { create(:province, :metro_manila) }
  let!(:bulacan) { create(:province, :bulacan) }
  let!(:outside_ph) { create(:province, :outside_ph) }

  describe 'GET /index' do
    it 'shows all the provinces' do
      get provinces_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Metro Manila')
      expect(response.body).to include('Bulacan')
      expect(response.body).to include('Outside PH')
    end
  end

  describe 'GET /country/:country_id/provinces' do
    it 'shows the provinces related to a country' do
      get country_provinces_path(1)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Metro Manila')
      expect(response.body).to include('Bulacan')
      expect(response.body).not_to include('Outside PH')
    end
  end
end
