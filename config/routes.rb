Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#homepage'
  #single route syntax

  # get '/products', to: 'products#index'
  # get '/products/:id', to: 'products#show', as: 'product'
  # get '/products/new', to: 'products#new'
  # post '/products', to: 'products#create'

  #shortcut route generator syntax
    resources :products, except: [:edit, :update, :destroy]
end
