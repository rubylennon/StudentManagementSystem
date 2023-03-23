Rails.application.routes.draw do
  # devise routes
  devise_for :users

  # users routes
  resources :users, only: [:index, :show, :edit, :update]

  # home routes
  get 'home/index'

  # root path route ("/")
  root to: "home#index"

end
