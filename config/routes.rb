Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "movies#index"
  resources :movies, only: %i[ index show]
  resources :reviews, only: %i[ new create index ]
  resources :users, only: %i[index create]
end
