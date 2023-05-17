Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root to: 'home#index'
  get 'home' => 'home#index'
  get 'dashboard' => 'dashboard#index'
  get '/hospitals/new', to: 'hospitals#new'

  # root "articles#index"
  namespace :admin do
    resources :users
    resources :roles
    resources :organizations
    resources :hospitals

    root to: "roles#index"
  end

end
