# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/test_login', to: 'users#test_login'
  post '/posts', to: 'posts#confirm'
  patch '/post', to: 'posts#index'
  get '/post', to: 'posts#index'
  delete '/post', to: 'posts#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :posts, only: %i[new index show] do
    resources :likes, only: %i[create destroy]
  end
  resources :relationships, only: %i[create destroy]
end
