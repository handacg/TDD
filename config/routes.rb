Rails.application.routes.draw do
  root 'static_pages#index'
  
  # Static pages
  get 'club', to: 'static_pages#club'
  # Sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  
  resources :users
  get 'signup', to: 'users#new'

end
