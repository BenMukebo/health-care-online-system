Rails.application.routes.draw do
  devise_for :users
  get '/users', to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'signup', to: 'users#signup'

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    resources :users
    resources :roles
    resources :hospitals, only: [:index, :show, :edit, :update, :new, :create, :destroy]
  end

  root to: "home#home"
end
