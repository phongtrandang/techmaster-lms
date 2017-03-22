Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "courses#index"

  resources :courses

  get 'accounts/new', to: "accounts#new"
  post 'accounts', to: "accounts#create"

  get 'account/login', to: "sessions#new"
  post "account/sessions", to: "sessions#create"
  delete "account/logout", to: "sessions#destroy"
  post "courses/:id/enroll", to: "courses#enroll"

  namespace :admin do
    root to: "courses#index"
  end

end
