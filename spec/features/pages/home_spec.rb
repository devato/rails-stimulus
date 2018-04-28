require 'rails_helper'

RSpec.feature 'Viewing Homepage', type: :feature do
  context 'As a visitor' do
    scenario 'I should see a welcome message' do
      visit root_path
      expect(page).to have_text('Homepage')
    end

    scenario 'I should see a login link' do
      visit root_path
      expect(page).to have_text('Login')
    end

    scenario 'I should see a signup link' do
      visit root_path
      expect(page).to have_text('Signup')
    end
  end

  context 'As an active user' do
    let(:user) { create(:user) }

    before do
      login(user)
    end

    scenario 'I should see a welcome message' do
      visit root_path
      expect(page).to have_text('Homepage')
    end

    scenario 'I should see a link to the dashboard' do
      visit root_path
      expect(page).to have_text('Dashboard')
    end
  end
end
