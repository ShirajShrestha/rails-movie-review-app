Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "movies#index"
  resources :movies, only: %i[ index show]
  resources :reviews, only: %i[ new create index destroy ]
  resources :users, only: %i[index create]

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index show]
    end
  end
end
