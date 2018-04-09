require "rails_helper"

RSpec.feature 'Onboard: Signup Spec', type: :feature do

  context 'As a visitor' do

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
        submit_registration
        expect(page).to have_content('Create Project')
      end
    end
  end

  context 'As an active user' do

    let(:user) { create(:user) }

    before do
      login(user)
    end

    context 'Given I have no projects' do
      scenario 'I should see the new project page' do
        visit signup_path
        expect(page).to have_text('Create Project')
      end
    end

    context 'Given I have an existing project' do

      let(:project) { create(:project, organization: user.organizations.first) }

      before do
        user.projects << project
      end

      scenario 'I should see the organization dashboard' do
        visit signup_path
        expect(page).to have_text('Welcome')
      end
    end

  end
end
