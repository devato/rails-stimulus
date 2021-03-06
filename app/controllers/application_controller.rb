class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login

  include CurrentObjects
  include Rectify::ControllerHelpers
  include ApplicationHelper

  private

  def not_authenticated
    redirect_to login_path, alert: 'Please login first'
  end
end
