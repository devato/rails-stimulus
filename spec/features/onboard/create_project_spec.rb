require 'rails_helper'

feature 'Onboard: Create Project Spec', js: true, type: :feature do
  context 'As a visitor' do
    scenario 'I should be redirected to login' do
      visit new_project_path
      expect(page).to have_text('Sign in to your account')
    end

    context 'After registering' do
      let!(:lang) { create(:supported_language) }

      scenario 'I should see the new project form' do
        submit_registration
        expect(page).to have_content('Create Project')
        expect(page).to have_css('input[type=radio]', count: 1)
        expect(page).to have_field('project_name')
      end

      scenario 'I should be able to create a project' do
        submit_registration
        expect(page).to have_content('Create Project')
        within('form.form-horizontal') do
          choose('project[supported_language_id]', match: :first)
          fill_in('project_name', with: 'demo')
          click_button('Continue')
        end
        expect(page).to have_content('Successfully created project')
      end
    end
  end

  context 'As an active user' do
  end
end
