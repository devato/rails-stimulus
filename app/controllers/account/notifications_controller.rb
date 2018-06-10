class Account::NotificationsController < Account::BaseController

  def edit
    @account_form = Account::NotificationsForm.new
  end

  def update

  end
end
