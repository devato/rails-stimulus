class Users::SignupsController < Users::BaseController

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user)
      .permit(:name, :email, :password, :password_confirmation)
  end
end
