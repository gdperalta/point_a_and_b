class ShipmentQuotesController < ApplicationController
  before_action :set_shipment_quote, only: %i[show edit update destroy]

  def index
    @shipment_quotes = ShipmentQuote.all
  end

  def show; end

  def new
    @shipment_quote = ShipmentQuote.new
    @shipment_quote.build_pickup_address
    @shipment_quote.build_delivery_address
  end

  def edit; end

  def create
    @shipment_quote = ShipmentQuote.new(shipment_quote_params)

    respond_to do |format|
      if @shipment_quote.save
        format.html do
          redirect_to shipment_quote_url(@shipment_quote), notice: 'Shipment quote was successfully created.'
        end
        format.json { render :show, status: :created, location: @shipment_quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipment_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shipment_quote.update(shipment_quote_params)
        format.html do
          redirect_to shipment_quote_url(@shipment_quote), notice: 'Shipment quote was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @shipment_quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipment_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shipment_quote.destroy

    respond_to do |format|
      format.html { redirect_to shipment_quotes_url, notice: 'Shipment quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_shipment_quote
    @shipment_quote = ShipmentQuote.find(params[:id])
  end

  def shipment_quote_params
    params.require(:shipment_quote).permit(:pickup_address_id, :delivery_address_id,
                                           pickup_address_attributes: %i[id address1 address2 city_id
                                                                         zip_code address_type],
                                           delivery_address_attributes: %i[id address1 address2 city_id
                                                                           zip_code address_type])
  end
end
