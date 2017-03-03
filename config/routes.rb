Rails.application.routes.draw do
  resources :styles
  resources :memberships
  resources :beer_clubs
  resources :beers

  resources :users do
    post 'toggle_frozen', on: :member
  end

  resources :breweries do
    post 'toggle_activity', on: :member
  end

  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'  
  root 'breweries#index'
  resources :places, only:[:index, :show]
  post 'places', to:'places#search'
  get 'beerlist', to:'beers#list'
  get 'ngbeerlist', to:'beers#nglist'
  get 'brewerylist', to:'breweries#list'
end