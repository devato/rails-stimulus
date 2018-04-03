class Dashboard::BaseController < ApplicationController
  layout 'dashboard'
  before_action :require_login
end
