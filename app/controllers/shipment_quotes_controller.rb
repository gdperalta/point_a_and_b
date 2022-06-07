class ShipmentQuotesController < ApplicationController
  before_action :set_shipment_quote, only: %i[ show edit update destroy ]

  # GET /shipment_quotes or /shipment_quotes.json
  def index
    @shipment_quotes = ShipmentQuote.all
  end

  # GET /shipment_quotes/1 or /shipment_quotes/1.json
  def show
  end

  # GET /shipment_quotes/new
  def new
    @shipment_quote = ShipmentQuote.new
  end

  # GET /shipment_quotes/1/edit
  def edit
  end

  # POST /shipment_quotes or /shipment_quotes.json
  def create
    @shipment_quote = ShipmentQuote.new(shipment_quote_params)

    respond_to do |format|
      if @shipment_quote.save
        format.html { redirect_to shipment_quote_url(@shipment_quote), notice: "Shipment quote was successfully created." }
        format.json { render :show, status: :created, location: @shipment_quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shipment_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipment_quotes/1 or /shipment_quotes/1.json
  def update
    respond_to do |format|
      if @shipment_quote.update(shipment_quote_params)
        format.html { redirect_to shipment_quote_url(@shipment_quote), notice: "Shipment quote was successfully updated." }
        format.json { render :show, status: :ok, location: @shipment_quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shipment_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipment_quotes/1 or /shipment_quotes/1.json
  def destroy
    @shipment_quote.destroy

    respond_to do |format|
      format.html { redirect_to shipment_quotes_url, notice: "Shipment quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment_quote
      @shipment_quote = ShipmentQuote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shipment_quote_params
      params.fetch(:shipment_quote, {})
    end
end
