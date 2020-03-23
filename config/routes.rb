Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/test_login',  to: 'users#test_login'
  post '/posts', to: 'posts#confirm'
  patch '/post', to: 'posts#index'
  get '/post', to: 'posts#index'
  delete '/post', to: 'posts#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :posts, only: [:new, :index]

end
