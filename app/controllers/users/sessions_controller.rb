class Users::SessionsController < Users::BaseController
  skip_before_action :require_login, except: [:destroy]
  def new; end

  def destroy; end
end
