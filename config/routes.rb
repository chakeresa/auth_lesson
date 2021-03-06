Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :new, :create]

  resources :sessions, only: [:index]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/login', to: "sessions#destroy"

  get '/secret', to: "users#secret"
end
