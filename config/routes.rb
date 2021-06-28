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
      resources :subscriptions
      resources :purchase_orders
      get 'user/:user_id/subscriptions', controller: :subscriptions, action: :user_subscriptions
      post '/subscribe/:product_id', controller: :subscriptions, action: :create
    end
  end

  root to: 'home#index'

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
