Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard/index#index'
  namespace :users do
    resources :signups, only: [:index, :new, :create]
    resources :sessions, only: [:index, :new, :create]
  end
  get 'login' => 'users/sessions#new', as: :login
  post 'logout' => 'users/sessions#destroy', as: :logout

  scope module: :dashboard do
    resources :projects
  end
end
