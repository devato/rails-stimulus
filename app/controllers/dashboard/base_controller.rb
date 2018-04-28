class Dashboard::BaseController < ApplicationController
  layout 'dashboard'

  before_action :require_project

  private

  def require_project
    redirect_to :new_project if Current.user.projects.empty?
  end
end
