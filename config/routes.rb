Rails.application.routes.draw do
  root "static_pages#index"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/signin", to: "sessions#create"

  namespace :admin do
    resources :users
  end
end
