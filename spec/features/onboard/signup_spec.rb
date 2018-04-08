require "rails_helper"

RSpec.feature 'Onboard: Signup Spec', type: :feature do

  context 'As a visitor' do

    let(:new_user) { build(:user) }

    scenario 'I should see a signup link on the homepage' do
      visit root_path
      expect(page).to have_text('Signup')
    end

    scenario 'I should see the full signup form' do
      visit users_signups_path
      expect(page).to have_text('Set up your new account today')
      expect(page).to have_css('form.form-horizontal')
      expect(page).to have_field('signup_name')
      expect(page).to have_field('signup_email')
      expect(page).to have_field('signup_password')
      expect(page).to have_field('signup_password_confirmation')
      expect(page).to have_field('signup_terms')
    end

    context 'When form has errors' do
      scenario 'I should NOT be able to register' do
        visit users_signups_path
        within('form.form-horizontal') do
          click_button('Create account')
          expect(page).to have_field('signup_terms')
        end
      end
    end

    context 'When form is valid' do
      scenario 'I should be able to register' do
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
        expect(page).to have_content('Create Project')
      end
    end
  end

  context 'As an active user' do

    # let(:user) { create(:user) }
    #
    # before do
    #   login(user)
    # end
    #
    # scenario 'I should see a welcome message' do
    #   visit root_path
    #   expect(page).to have_text('Homepage')
    # end
    #
    # scenario 'I should see a link to the dashboard' do
    #   visit root_path
    #   expect(page).to have_text('Dashboard')
    # end
  end
end
