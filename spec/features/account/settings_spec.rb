require 'rails_helper'

feature 'When I visit the account settings page', js: true, type: :feature do
  context 'As a visitor' do
    scenario 'I should be redirected to login' do
      visit new_project_path
      expect(page).to have_text('Sign in to your account')
    end
  end

  context 'As an active user' do
    before do

    end
    context 'And the form data is valid' do
      scenario 'I should be able to update account and preferences' do
        visit new_project_path
        expect(page).to have_text('Sign in to your account')
      end
    end
  end
end
