# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/test_login', to: 'users#test_login' 
  get '/new_post', to: 'posts#new'
  post '/new_post', to: 'posts#new'
  post '/posts', to: 'posts#confirm'
  get '/post', to: 'posts#index'
  post '/post/create', to: 'posts#create'
  delete '/post', to: 'posts#destroy'
  get 'post/:id', to: 'posts#show'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: %i[new create edit update]
  resources :posts, only: %i[new show index] do
    resources :likes, only: %i[destroy create]
  end
  resources :relationships, only: %i[create destroy]
end
