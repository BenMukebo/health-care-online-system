Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/hospitals/new', to: 'hospitals#new'

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    resources :users
    resources :roles
    resources :hospitals, only: [:index, :show, :edit, :update, :new, :create ]
  end

  root to: "admin/users#index"
end
