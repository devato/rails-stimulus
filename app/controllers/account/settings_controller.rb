class Account::SettingsController < Account::BaseController

  def edit
    @account_form = Account::SettingsForm.new
  end

  def update
    @account_form = Account::SettingsForm.from_params(params)
    User::SaveSettings.call(@account_form) do
      on(:ok) do |user|
        redirect_to account_settings_path(script_name: false),
          alert: 'Successfully updated account settings'
      end
      on(:invalid) { render :edit }
    end


  rescue => e
    redirect_to account_settings_path(script_name: false),
      alert: 'Something went wrong while saving account settings'
  end
end
