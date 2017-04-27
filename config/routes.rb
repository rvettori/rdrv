Rails.application.routes.draw do
  resources :contacts
  resources :zipcodes
  devise_for :users
  root to: 'home#index'
end
