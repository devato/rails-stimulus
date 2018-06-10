class Account::SettingsController < Account::BaseController

  def edit
    @account_form = Account::SettingsForm.new
  end

  def update

  end
end
