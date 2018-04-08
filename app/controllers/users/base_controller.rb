class Users::BaseController < ApplicationController
  include ApplicationHelper
  layout 'auth'

  before_action :redirect_to_dashboard

  def redirect_to_dashboard
    redirect_to organization_home if Current.user.present?
  end
end
