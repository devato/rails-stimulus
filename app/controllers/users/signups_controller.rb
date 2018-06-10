class Users::SignupsController < Users::BaseController
  skip_before_action :require_login

  def index
    redirect_to signup_path
  end

  def new
    @signup_form = User::SignupForm.new
  end

  def create
    @signup_form = User::SignupForm.from_params(params)
    User::CreateAccount.call(@signup_form) do
      on(:ok) do |user|
        @user = auto_login(user)
        redirect_back_or_to organization_home
      end
      on(:invalid) { render :new }
    end
  end

  private

  def user_params
    params.require(:user)
          .permit(:name, :email, :password, :password_confirmation)
  end
end
