source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm', '~> 4.12'
gem 'activemodel-email_address_validator', '~> 1.0'
gem 'activerecord-multi-tenant', git: 'git@github.com:devato/activerecord-multi-tenant.git'
gem 'bootsnap', '~> 1.2', require: false
gem 'flash_rails_messages', '~> 0.1'
gem 'foreman', '~> 0.84'
gem 'friendly_id', '~> 5.2'
gem 'pg', '~> 1.0', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0.rc2'
gem 'rectify', '~> 0.11'
gem 'rubocop', '~> 0.54'
gem 'sidekiq', '~> 5.1'
gem 'simple_form', '~> 3.5'
gem 'slim-rails', '~> 3.1'
gem 'sorcery', '~> 0.11'
gem 'webpacker', github: 'rails/webpacker'

group :development, :test do
  gem 'byebug', '~> 10.0', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.2'
  gem 'factory_bot', '~> 4.8'
end

group :test do
  gem 'capybara-selenium', '~> 0.0.6'
  gem 'database_cleaner', '~> 1.6'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'bullet', '~> 5.0'
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'listen', '~> 3.1', '< 3.2'
  gem 'rack-livereload', '~> 0.3'
  gem 'spring', '~> 2.0'
  gem 'spring-watcher-listen', '~> 2.0'
  gem 'web-console', github: 'rails/web-console'
end

gem 'inquisition', github: 'rubygarage/inquisition', group: %w[development test]
