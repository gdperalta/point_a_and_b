require 'rails_helper'

RSpec.describe '/shipment_quotes', type: :request do
  let!(:lalamove) { create(:courier_rate, :lalamove) }
  let!(:grab) { create(:courier_rate, :grab) }
  let!(:jnt_express) { create(:courier_rate, :jnt_express) }
  let!(:lbc) { create(:courier_rate, :lbc) }

  let!(:country) { create(:country, :ph) }
  let!(:metro_manila) { create(:province, :metro_manila) }
  let!(:bulacan) { create(:province, :bulacan) }
  let!(:city1) { create(:city, :city1) }
  let!(:city2) { create(:city, :city2) }

  let(:valid_attributes) do
    { pickup_address_attributes: pickup_valid_attributes,
      delivery_address_attributes: delivery_valid_attributes }
  end

  let(:pickup_valid_attributes) do
    attributes_for(:address, :pickup, id: nil)
  end

  let(:delivery_valid_attributes) do
    attributes_for(:address, :pickup, id: nil)
  end

  let(:pickup_invalid_attributes) do
    attributes_for(:address, :pickup, id: nil, zip_code: '12')
  end

  let(:delivery_invalid_attributes) do
    attributes_for(:address, :pickup, id: nil, address1: '')
  end

  let(:invalid_attributes) do
    { pickup_address_attributes: pickup_invalid_attributes,
      delivery_address_attributes: delivery_invalid_attributes }
  end

  context 'With created shipment quotes' do
    let!(:pickup_address) { create(:address, :pickup) }
    let!(:delivery_within) { create(:address, :delivery_within) }
    let!(:delivery_outside) { create(:address, :delivery_outside) }
    let!(:quote_within) { create(:shipment_quote, :within) }
    let!(:quote_outside) { create(:shipment_quote, :outside) }
    describe 'GET /index' do
      it 'renders a successful response' do
        get shipment_quotes_url
        expect(response).to be_successful
        expect(response.body).to include('My Address')
        expect(response.body).to include('New Address')
        expect(response.body).to include('Test Address')
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
        get shipment_quote_url(quote_within)
        expect(response).to be_successful
        expect(response.body).to include('My Address')
        expect(response.body).to include('New Address')
        expect(response.body).to include('Name')
        expect(response.body).to include('Delivery Option')
        expect(response.body).to include('Rate')
        expect(response.body).to include('Lalamove')
        expect(response.body).to include('Grab')
        expect(response.body).to include('J&amp;T Express')
        expect(response.body).to include('LBC')
      end
    end

    describe 'GET /edit' do
      it 'render a successful response' do
        get edit_shipment_quote_url(quote_within)
        expect(response).to be_successful
        expect(response.body).to include('Address')
        expect(response.body).to include('Alternative Address')
        expect(response.body).to include('Country')
        expect(response.body).to include('Province')
        expect(response.body).to include('City')
        expect(response.body).to include('Zip Code')
        expect(response.body).to include('Compute Rates')
        expect(response.body).to include('Save Quotation')
      end
    end

    describe 'PATCH /update' do
      context 'with valid parameters' do
        let(:new_attributes) do
          { pickup_address_attributes: new_pickup_attributes,
            delivery_address_attributes: new_delivery_attributes }
        end

        let(:new_pickup_attributes) do
          attributes_for(:address, :pickup, id: nil, address1: 'New input address')
        end

        let(:new_delivery_attributes) do
          attributes_for(:address, :pickup, id: nil, zip_code: '9000')
        end

        it 'updates the requested shipment_quote' do
          patch shipment_quote_url(quote_within), params: { shipment_quote: new_attributes }
          quote_within.pickup_address.reload
          quote_within.delivery_address.reload
          quote_within.reload
          expect(quote_within.pickup_address.address1).to eql('New input address')
          expect(quote_within.delivery_address.zip_code).to eql('9000')
        end

        it 'redirects to the shipment_quote' do
          patch shipment_quote_url(quote_within), params: { shipment_quote: new_attributes }
          quote_within.reload
          expect(response).to redirect_to(shipment_quote_url(quote_within))
        end
      end

      context 'with invalid parameters' do
        it "renders a successful response (i.e. to display the 'edit' template)" do
          patch shipment_quote_url(quote_within), params: { shipment_quote: invalid_attributes }
          expect(response.body).to include('Edit Shipment Quotation')
        end
      end
    end

    describe 'DELETE /destroy' do
      it 'destroys the requested shipment_quote' do
        expect do
          delete shipment_quote_url(quote_within)
        end.to change(ShipmentQuote, :count).by(-1)
      end

      it 'redirects to the shipment_quotes list' do
        delete shipment_quote_url(quote_within)
        expect(response).to redirect_to(shipment_quotes_url)
      end
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_shipment_quote_url
      expect(response).to be_successful
      expect(response.body).to include('Address')
      expect(response.body).to include('Alternative Address')
      expect(response.body).to include('Country')
      expect(response.body).to include('Province')
      expect(response.body).to include('City')
      expect(response.body).to include('Zip Code')
      expect(response.body).to include('Compute Rates')
      expect(response.body).to include('Save Quotation')
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ShipmentQuote' do
        expect do
          post shipment_quotes_url,
               params: { shipment_quote: valid_attributes }
        end.to change(ShipmentQuote, :count).by(1)
      end

      it 'redirects to the created shipment_quote' do
        post shipment_quotes_url, params: { shipment_quote: valid_attributes }
        expect(response).to redirect_to(shipment_quote_url(ShipmentQuote.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ShipmentQuote' do
        expect do
          post shipment_quotes_url, params: { shipment_quote: invalid_attributes }
        end.to change(ShipmentQuote, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post shipment_quotes_url, params: { shipment_quote: invalid_attributes }
        expect(response.body).to include('Calculate Shipment Quotation')
      end
    end
  end
end
