Rails.application.routes.draw do
  resources :styles
  resources :bars
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :places, only:[:index, :show]
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'  
  root 'breweries#index'
  get 'places', to: 'places#index'
  # get 'places/:id', to:'places#show'
  post 'places', to:'places#search'
  get 'panimo/:id', to: 'breweries#show'
end