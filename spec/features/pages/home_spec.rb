require "rails_helper"

RSpec.feature 'Viewing Homepage', type: :feature do

  before do
    page.driver.header('REQUEST_PATH', root_path)
  end

  context 'As a visitor' do

    scenario 'I should see a welcome message' do
      visit root_path
      expect(page).to have_text('Homepage')
    end
  end

end
