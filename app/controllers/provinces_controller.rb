class ProvincesController < ApplicationController
  def index
    @provinces = Province.all
    render json: @provinces
  end

  def find_by_country
    @provinces = Province.find_by_country(params[:country_id])
    render json: @provinces
  end
end
