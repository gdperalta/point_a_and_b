Rails.application.routes.draw do
  resources :shipment_quotes
  get '/countries', to: 'countries#index', as: 'countries'
  get '/provinces', to: 'provinces#index', as: 'provinces'
  get '/countries/:country_id/provinces', to: 'provinces#find_by_country', as: 'country_provinces'
  get '/cities', to: 'cities#index', as: 'cities'
  get '/provinces/:province_id/cities', to: 'cities#find_by_province', as: 'province_cities'

  root 'shipment_quotes#new'
end
