Rails.application.routes.draw do
  resources :zipcodes
  devise_for :users
  root to: 'visitors#index'
end
