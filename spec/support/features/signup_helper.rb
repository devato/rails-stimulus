module Features
  module SignupHelper

    def submit_registration(new_user = build(:user))
      visit users_signups_path
      within('form.form-horizontal') do
        fill_in('signup_name', with: "#{new_user.first_name} #{new_user.last_name}")
        fill_in('signup_email', with: new_user.email)
        fill_in('signup_password', with: new_user.password)
        fill_in('signup_password_confirmation', with: new_user.password)
        fill_in('signup_organization_name', with: 'orgname')
        check('signup_terms')
        click_button('Create account')
      end
    end
  end

end

RSpec.configure do |config|
  config.include Features::SignupHelper, type: :feature
end
