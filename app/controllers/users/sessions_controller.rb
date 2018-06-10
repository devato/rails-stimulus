class Users::SessionsController < Users::BaseController
  skip_before_action :require_login, except: [:destroy]
  skip_before_action :redirect_to_dashboard, only: [:destroy]

  def index
    redirect_to login_path
  end

  def new
    @form = User::LoginForm.new
  end

  def create
    @form = User::LoginForm.from_params(params)
    User::Login.call(@form) do
      on(:ok)      { redirect_back_or_to organization_home }
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
