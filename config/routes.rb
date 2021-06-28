# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :records
      resources :artists
      resources :products
      resources :users
      resources :ratings
      resources :addresses
      get 'user/:user_id/addresses', controller: :addresses, action: :addresses_by_id
    end
  end

  root to: 'home#index'

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
