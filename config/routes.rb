Rails.application.routes.draw do
  namespace :driver do
    get 'competition_entries/index'
    get 'competition_entries/show'
    get 'competition_entries/new'
    get 'competition_entries/edit'
    get 'competition_entries/create'
    get 'competition_entries/update'
    get 'competition_entries/destroy'
    get 'competitions/index'
    get 'competitions/show'
  end
  devise_for :users, path: 'user', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  devise_for :admins, path: 'admin', controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :drivers, path: '/', controllers: {
    sessions: 'drivers/sessions',
    registrations: 'drivers/registrations'
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

  # Driver routes
  scope module: 'driver', path: '/driver', as: 'driver' do
    resources :competitions, only: [:index, :show] do
      resources :competition_entries, path: 'entries', as: 'entries'
    end
  end
end