Rails.application.routes.draw do
  root "movies#index"

  get "signup" => "users#new"
  resources :users

  resources :movies do
    resources :reviews
  end
end