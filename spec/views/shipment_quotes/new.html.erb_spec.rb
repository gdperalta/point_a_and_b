require 'rails_helper'

RSpec.describe "shipment_quotes/new", type: :view do
  before(:each) do
    assign(:shipment_quote, ShipmentQuote.new())
  end

  it "renders new shipment_quote form" do
    render

    assert_select "form[action=?][method=?]", shipment_quotes_path, "post" do
    end
  end
end
