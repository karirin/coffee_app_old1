# frozen_string_literal: true

Rails.application.routes.draw do
  get 'maps/index'

  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/test_login', to: 'users#test_login'
  post '/posts', to: 'posts#confirm'
  post '/post/create', to: 'posts#create'
  get 'post/:id', to: 'posts#show'
  get '/map', to: 'posts#map'
  resources :maps, only: %i[index create]
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :posts do
    resources :likes, only: %i[destroy create]
  end
  resources :relationships, only: %i[create destroy]
end
