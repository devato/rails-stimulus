class Account::SettingsController < Account::BaseController

  def edit
    @account_form = Account::SettingsForm.new
  end

  def update
    @account_form = Account::SettingsForm.from_params(params)
    if @account_form.valid?
      redirect_to account_settings_path(script_name: false),
        notice: 'Successfully saved account settings'
    else
      redirect_to account_settings_path(script_name: false),
        alert: @account_form.errors.full_messages.first
    end

  rescue => e
    redirect_to account_settings_path(script_name: false),
      alert: 'Something went wrong while saving account settings'
  end
end
