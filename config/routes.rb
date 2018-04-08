Rails.application.routes.draw do

  root 'dashboard/index#index'

  namespace :users do
    resources :signups, only: %i[index new create]
    resources :sessions, only: %i[index new create]
  end
  get 'login' => 'users/sessions#new', as: :login
  post 'logout' => 'users/sessions#destroy', as: :logout

  scope module: :dashboard do
    resources :projects
  end
end
