Rails.application.routes.draw do
  resources :contacts
  resources :contacts
  resources :zipcodes, defaults: {format: :json}
  resources :occupations, defaults: {format: :json}
  devise_for :users
  root to: 'home#index'
end
