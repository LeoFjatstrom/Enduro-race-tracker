Rails.application.routes.draw do
  resources :competitions
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "home#index"

  resources :competitions
end
