Rails.application.routes.draw do
  resources :genres
  resources :favorites
  root "movies#index"

  get "signup" => "users#new"
  resources :users

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

end