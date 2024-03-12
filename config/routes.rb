Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root 'welcome#index'
  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: %i[create] do
    get '/dashboard', to: 'users#dashboard', as: 'dashboard'
    resources :discover, only: %i[index], module: 'users'
    resources :movies, only: %i[index], module: 'users'
    # get '/discover/index', to: 'users/discover#index', as: 'discover_index'
  end
end
