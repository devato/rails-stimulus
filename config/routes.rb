Rails.application.routes.draw do

  namespace :users do
    get 'sessions/new'
  end

  namespace :users do
    get 'sessions/destroy'
  end

  root 'dashboard/index#index'

  namespace :users do
    resources :signups
    resources :sessions
  end
  get 'login' => 'users/sessions#new', as: :login
  post 'logout' => 'users/sessions#destroy', as: :logout


  namespace :dashboard do
    root 'index#index'
  end

end
