Rails.application.routes.draw do

  root 'dashboard/index#index'

  namespace :users do
    resources :signups, only: [:index, :new, :create]
    resources :sessions, only: [:index, :new, :create]
  end
  get 'login' => 'users/sessions#new', as: :login
  post 'logout' => 'users/sessions#destroy', as: :logout

  match '/onboard/organization' => 'dashboard/onboard#organization', as: :onboard_organization, via: [:get, :post]
  match '/onbaord/project' => 'dashboard/onboard#project', as: :onboard_project, via: [:get, :post]

  scope '/:organization_id', as: :organization do
    scope module: :dashboard do
      root 'index#index'
      # match 'organization' => 'onboard#organization', as: :onboard_organization, via: [:get, :post]
      # match 'project' => 'onboard#project', as: :onboard_project, via: [:get, :post]
    end
  end

end
