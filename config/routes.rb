Rails.application.routes.draw do
  resources :shipment_quotes

  root 'shipment_quotes#index'
end
