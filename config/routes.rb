Rails.application.routes.draw do
  # devise routes
  devise_for :users

  # users routes
  resources :users, only: [:index, :show, :edit, :update]

  # users search
  get 'search', to: "users#search"

  # home routes
  get 'home/index'

  # root path route ("/")
  root to: "home#index"

end
