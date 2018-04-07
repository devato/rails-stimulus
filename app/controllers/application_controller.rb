class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_currents

  private

  def not_authenticated
    redirect_to login_path, alert: 'Please login first'
  end

  def set_supported_languages
    @supported_languages = SupportedLanguage.active
  end

  def set_currents
    Current.user = current_user
  end
end
