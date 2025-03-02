source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 6.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'bootstrap'
gem 'faker'

# Use Sass to process CSS
gem 'sassc-rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"
gem 'shoulda-matchers'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'pry'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'rubocop-rails'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'simplecov'
end

# Shim to load environment variables from .env into ENV in development. [https://github.com/bkeepers/dotenv]
gem 'dotenv', groups: %i[development test]

# A fixtures replacement with a straightforward definition syntax. [https://github.com/thoughtbot/factory_bot]
gem 'factory_bot'

# Additional compatibility with Rails [https://github.com/thoughtbot/factory_bot_rails]
gem 'factory_bot_rails'

# A simple and consistent HTTP client library for Ruby [https://github.com/lostisland/faraday]
gem 'faraday'

# Storing and accessing secrets [https://github.com/laserlemon/figaro]
# gem 'figaro'

# A small gem which causes rails console to open pry [https://github.com/pry/pry-rails]
gem 'pry-rails'

# A template language for reducing html syntax [https://github.com/slim-template/slim]
gem 'slim'

# Validate the JSON returned by your Rails JSON APIs [https://github.com/thoughtbot/json_matchers]
gem 'json_matchers'

# Validates JSON attributes against a JSON schema. [https://github.com/mirego/activerecord_json_validator]
gem 'activerecord_json_validator'

gem 'vcr'

gem 'webmock'
