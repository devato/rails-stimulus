class Users::SignupsController < Users::BaseController
  skip_before_action :require_login

  def index
    redirect_to signup_path
  end

  def new
    @signup_form = Users::SignupForm.new
  end

  def create
    @signup_form = Users::SignupForm.from_params(params)
    Users::CreateAccount.call(@signup_form) do
      on(:ok)      { redirect_back_or_to root_path }
      on(:invalid) { render :new }
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end
end
