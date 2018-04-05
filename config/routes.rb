Rails.application.routes.draw do

  root 'dashboard/index#index'

  namespace :users do
    resources :signups, only: [:index, :new, :create]
    resources :sessions, only: [:index, :new, :create]
  end
  get 'login' => 'users/sessions#new', as: :login
  post 'logout' => 'users/sessions#destroy', as: :logout

  namespace :dashboard do
    root 'index#index'
    match 'organization' => 'onboard#organization', as: :onboard_organization, via: [:get, :post]
    match 'application' => 'onboard#application', as: :onboard_application, via: [:get, :post]
    match 'invitation' => 'onboard#invitation', as: :onboard_invitation, via: [:get, :post]
  end

end
