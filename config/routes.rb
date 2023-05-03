Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/hospitals/new', to: 'hospitals#new'

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    resources :users do
      delete :image, on: :member, action: :destroy_image
    end
    resources :roles
    resources :organizations
    resources :hospitals
    resources :contracts do
      delete :legal_documents, on: :member, action: :destroy_document
    end

    root to: "roles#index"
  end

  root to: "admin/users#index"
end
