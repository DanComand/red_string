Rails.application.routes.draw do

  resources :items
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

end
