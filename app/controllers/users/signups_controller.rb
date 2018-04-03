class Users::SignupsController < Users::BaseController

  def new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
