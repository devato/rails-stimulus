source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'aasm'
gem 'activemodel-email_address_validator'
gem 'flash_rails_messages'
gem 'foreman'
gem 'friendly_id', '~> 5.1.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.6'
gem 'rectify'
gem 'rubocop'
gem 'sidekiq'
gem 'simple_form'
gem 'slim-rails'
gem 'sorcery'
gem 'webpacker', github: 'rails/webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot'
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rack-livereload'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', github: 'rails/web-console'
end
