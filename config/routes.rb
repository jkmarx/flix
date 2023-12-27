Rails.application.routes.draw do
  resources :favorites
  root "movies#index"

  get "signup" => "users#new"
  resources :users

  resources :movies do
    resources :reviews
  end

  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"

end