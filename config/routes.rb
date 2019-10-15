Rails.application.routes.draw do

  resources :books

  resources :users, only: [:show]

  root 'home#index'

  post 'users' => 'books#create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
