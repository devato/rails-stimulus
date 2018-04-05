class Users::SessionsController < Users::BaseController
  skip_before_action :require_login, except: [:destroy]

  def index
    redirect_to login_path
  end

  def new
    @form = Users::LoginForm.new
  end

  def create
    @form = Users::LoginForm.from_params(params)
    Users::Login.call(@form) do
      on(:ok)      { redirect_back_or_to dashboard_root_path }
      on(:invalid) { render :new }
      on(:not_found) do
        flash[:alert] = 'Username or password invalid'
        render :new
      end
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: 'Logged out!')
  end
end
