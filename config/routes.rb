# NOTE: helper classes for org constraints
class OrganizationPresent
  def current_user(request)
    User.find_by(id: request.session[:user_id])
  end

  def self.matches?(_request)
    Current.organization.present?
  end
end

# NOTE: helper classes for org constraints
class OrganizationNotPresent
  def current_user(request)
    User.find_by(id: request.session[:user_id])
  end

  def self.matches?(_request)
    Current.organization.nil?
  end
end

# Routes
Rails.application.routes.draw do
  root 'pages#home', constraints: OrganizationNotPresent
  root 'dashboard/index#index', constraints: OrganizationPresent

  namespace :users do
    resources :signups, only: %i[index new create]
    resources :sessions, only: %i[index new create]
  end
  get 'signup' => 'users/signups#new', as: :signup
  get 'login' => 'users/sessions#new', as: :login
  post 'logout' => 'users/sessions#destroy', as: :logout

  scope module: :dashboard do
    get '/:organization_id' => 'index#index', as: :organization_root
    resources :organizations
    resources :projects, param: :project_id
  end

  namespace :account do
    resource :settings, only: %i[update] do
      collection { get '/', action: :edit }
    end
    resource :notifications, only: %i[update] do
      collection { get '/', action: :edit }
    end
  end
end
