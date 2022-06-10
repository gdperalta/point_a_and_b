class CitiesController < ApplicationController
  def index
    @cities = City.all
    render json: @cities
  end

  def find_by_province
    @cities = City.find_by_province(params[:province_id])
    render json: @cities
  end
end
