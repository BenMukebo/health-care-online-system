Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  resources :users, only: [:index, :show, :update]

  # root "articles#index"
  namespace :admin do
    resources :users do
      delete :image, on: :member, action: :destroy_image
      delete :documents, on: :member, action: :destroy_document
    end
    resources :roles
    resources :organizations
    resources :hospitals
    resources :contracts do
      delete :legal_documents, on: :member, action: :destroy_legal_document
    end
    
    delete :custom_delete_image, to: 'users#delete_image'
    delete :custom_delete_document, to: 'users#delete_document'
    delete :custom_delete_legal_document, to: 'contracts#delete_legal_document'
    
    resources :healthcare_requests
    root to: "roles#index"
  end
  
  root to: 'home#index'
  get 'home' => 'home#index'
  # get 'dashboard' => 'dashboard#index'
  # get '/hospitals/new', to: 'hospitals#new'

  namespace :dashboard do
    resources :organizations, only: [:index, :show, :update] do
    end
    resources :hospitals do
      # member
    end
    root to: "organizations#index"
  end
end
