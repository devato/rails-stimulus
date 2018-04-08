RSpec.configure do |config|
  config.include Sorcery::TestHelpers::Rails::Controller, type: [:controller, :request]
  config.include Sorcery::TestHelpers::Rails::Integration, type: :feature
end
