class Dashboard::BaseController < ApplicationController
  layout 'dashboard'

  before_action :redirect_to_onboard

  def redirect_to_onboard
    unless current_user.onboard_complete?
      redirect_to dashboard_onboard_organization_path
    end
  end
end
