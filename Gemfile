source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm', '~> 4.12'
gem 'activemodel-email_address_validator', '~> 1.0'
gem 'activerecord-multi-tenant', git: 'git@github.com:devato/activerecord-multi-tenant.git'
gem 'bootsnap', '~> 1.3', require: false
gem 'draper', '~> 3.0'
gem 'flash_rails_messages', '~> 0.1'
gem 'foreman', '~> 0.84'
gem 'friendly_id', '~> 5.2'
gem 'mini_magick', '~> 4.8'
gem 'pg', '~> 1.0', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'rectify', '~> 0.12'
gem 'rubocop', '~> 0.57'
gem 'sidekiq', '~> 5.1'
gem 'simple_form', '~> 4.0'
gem 'slim-rails', '~> 3.1'
gem 'sorcery', '~> 0.12'
gem 'webpacker', github: 'rails/webpacker'

group :development, :test do
  gem 'dotenv-rails', '~> 2.4'
  gem 'factory_bot', '~> 4.10'
  gem 'ffaker', '~> 2.9'
  gem 'pry-rails', '~> 0.3'
  gem 'pry-remote', "~> 0.1"
end

group :test do
  gem 'capybara-selenium', '~> 0.0'
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec-rails', '~> 3.7'
  gem 'rspec_junit_formatter', '~> 0.4'
  gem 'chromedriver-helper', '~> 1.2' unless ENV['CI']
end

group :development do
  gem 'bullet', '~> 5.7'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'listen', '~> 3.1', '< 3.2'
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'web-console', github: 'rails/web-console'
end

gem 'inquisition', github: 'rubygarage/inquisition', group: %w[development test]
