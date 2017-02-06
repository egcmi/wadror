Rails.application.routes.draw do
  resources :memberships
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'breweries#index'
  get 'kaikki_bisset', to: 'beers#index'
  get 'beer_clubs', to: 'beer_clubs#index'
  #get 'ratings/new', to: 'ratings#new'
  #post 'ratings', to: 'ratings#create'

  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  get 'signout', to: 'sessions#destroy'

  resources :ratings, only: [:index, :new, :create, :destroy]
  resource :session, only: [:new, :create, :delete]
end
