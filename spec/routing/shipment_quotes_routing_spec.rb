require "rails_helper"

RSpec.describe ShipmentQuotesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/shipment_quotes").to route_to("shipment_quotes#index")
    end

    it "routes to #new" do
      expect(get: "/shipment_quotes/new").to route_to("shipment_quotes#new")
    end

    it "routes to #show" do
      expect(get: "/shipment_quotes/1").to route_to("shipment_quotes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/shipment_quotes/1/edit").to route_to("shipment_quotes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/shipment_quotes").to route_to("shipment_quotes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/shipment_quotes/1").to route_to("shipment_quotes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/shipment_quotes/1").to route_to("shipment_quotes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/shipment_quotes/1").to route_to("shipment_quotes#destroy", id: "1")
    end
  end
end
