module Features
  module LoginHelper

    def login(user, password = 'password')
      user.update_attributes password: password
      page.driver.post users_sessions_path, {email: user.email, password: password}
      visit root_url
    end

  end

end

RSpec.configure do |config|
  config.include Features::LoginHelper, type: :feature
end
