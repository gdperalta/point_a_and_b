require 'rails_helper'

RSpec.describe "shipment_quotes/edit", type: :view do
  before(:each) do
    @shipment_quote = assign(:shipment_quote, ShipmentQuote.create!())
  end

  it "renders the edit shipment_quote form" do
    render

    assert_select "form[action=?][method=?]", shipment_quote_path(@shipment_quote), "post" do
    end
  end
end
