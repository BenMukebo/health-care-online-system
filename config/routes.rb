Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

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
    # delete :custom_user_image_destroy, to: 'users#destroy_image'
    # delete :custom_legal_document_destroy, to: 'users#destroy_legal_document'
    root to: "roles#index"
  end
  
  root to: 'home#index'
  get 'home' => 'home#index'
  # get 'dashboard' => 'dashboard#index'
  # get '/hospitals/new', to: 'hospitals#new'

  namespace :dashboard do
    resources :organizations, only: [:index, :show, :update]
    resources :hospitals do
      # member
    end
    root to: "organizations#index"
  end
end
