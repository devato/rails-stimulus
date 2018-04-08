Rails.application.routes.draw do

  root 'pages#home'

  namespace :users do
    resources :signups, only: %i[index new create]
    resources :sessions, only: %i[index new create]
  end
  get 'login' => 'users/sessions#new', as: :login
  post 'logout' => 'users/sessions#destroy', as: :logout

  scope module: :dashboard do
    get '/:organization_id' => 'index#index', as: :organization_root
    resources :organizations
    resources :projects
  end
end
