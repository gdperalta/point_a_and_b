require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  let!(:country) { create(:country, :ph) }
  let!(:metro_manila) { create(:province, :metro_manila) }
  let!(:bulacan) { create(:province, :bulacan) }
  let!(:city) { create(:city, :city1) }
  let!(:city2) { create(:city, :city2) }

  describe 'GET /index' do
    it 'shows all the cities' do
      get cities_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('City 1')
      expect(response.body).to include('City 2')
    end
  end

  describe 'GET /provinces/:province_id/cities' do
    it 'shows the cities related to a province' do
      get province_cities_path(1)

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('City 1')
      expect(response.body).not_to include('City 2')
    end
  end
end
