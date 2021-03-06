Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "books#index"
  resources :books, only: [:index, :new, :create, :edit, :update, :show, :destroy]

  resources :users, only: [:show, :new, :create]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'
end
