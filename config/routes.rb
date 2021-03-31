Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#homepage'
  get 'auth/:provider/callback', to: 'sessions#omniauth'
  get '/users/reset_password', to: 'users#reset_form'
  post '/users/reset_password', to: 'users#password_reset'
  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  # get '/products', to: 'products#index'
  # get '/products/:id', to: 'products#show', as: 'product'
  # get '/products/new', to: 'products#new'
  # post '/products', to: 'products#create'

  #shortcut route generator syntax
  resources :products, only: [:index, :new, :create]
  resources :users, only: [:index, :show]
  resources :brands do
    resources :products, shallow: true
  end
    

end
