require 'rails_helper'

RSpec.describe "shipment_quotes/show", type: :view do
  before(:each) do
    @shipment_quote = assign(:shipment_quote, ShipmentQuote.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
