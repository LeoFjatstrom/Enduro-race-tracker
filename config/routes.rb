Rails.application.routes.draw do
  devise_for :drivers
  devise_for :users, path: 'user', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  
  
  root to: "home#index"

  # Admin routes
  scope module: 'admin', path: 'admin', as: 'admin' do
    resources :competitions do
      resources :station_registrations
    end
  end
  
  # User routes
  scope module: 'user', path: 'user', as: 'user' do
    resources :competitions, only: [:index, :show] do
      resources :station_registrations, only: [:new, :create]
    end
  end
end