require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  let!(:philippines) { create(:country, :ph) }
  let!(:malaysia) { create(:country, :mal) }

  describe 'GET /index' do
    it 'shows all the countries' do
      get countries_path

      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Philippines')
      expect(response.body).to include('Malaysia')
    end
  end
end
