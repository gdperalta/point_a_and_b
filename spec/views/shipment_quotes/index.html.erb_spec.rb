require 'rails_helper'

RSpec.describe "shipment_quotes/index", type: :view do
  before(:each) do
    assign(:shipment_quotes, [
      ShipmentQuote.create!(),
      ShipmentQuote.create!()
    ])
  end

  it "renders a list of shipment_quotes" do
    render
  end
end
