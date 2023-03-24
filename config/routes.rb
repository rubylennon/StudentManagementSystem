Rails.application.routes.draw do
  # devise routes
  devise_for :users

  # course_module routes
  resources :course_modules do
    resources :comments, only: [:create]
  end

  # users routes
  resources :users, only: [:index, :show, :edit, :update]

  # users search
  get 'search', to: "users#search"

  # home routes
  get 'home/index'

  # root path route ("/")
  root to: "home#index"

end
