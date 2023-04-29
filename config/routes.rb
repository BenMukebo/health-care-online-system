Rails.application.routes.draw do
  get 'homes/index'
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  devise_for :users

  get '/hospitals/new', to: 'hospitals#new'

  # root to: "users/sign_in"
end
