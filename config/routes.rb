Rails.application.routes.draw do
  root 'dashboard/index#index'

  namespace :dashboard do
    root 'index#index'
  end

end
