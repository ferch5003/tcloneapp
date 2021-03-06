source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Allow any model to follow any other model
gem 'acts_as_follower', github: 'brchristian/acts_as_follower', branch: 'patch-1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Authentication for Rails
gem 'devise'

# For Seeds information
gem 'faker'

# FontAwesome for Rails
gem 'font-awesome-rails', '~> 4.7'

#  "Swiss Army bulldozer" of slugging and permalink plugins for Active Record
gem 'friendly_id', '~> 5.4.0'

# Wrapper to get Gravatars
gem 'gravtastic'

# Pagination
gem 'pagy', '~> 4.11'

# Simple and advanced search forms for your Ruby on Rails application
gem 'ransack', github: 'activerecord-hackery/ransack'

# Soft Deletes
gem 'paranoia', '~> 2.2'

# Structure for seeders
gem 'seedbank', '~> 0.5.0'

# Mailer for transactional mails
gem 'sendgrid-ruby'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Increase your application's performance by reducing the number of queries it makes (N + 1 problem)
  gem 'bullet'
  # For enviromental variables
  gem 'dotenv-rails'
  # Add fixtures to RSpec tests
  gem 'factory_bot_rails'
  # RSpec testing framework to Ruby on Rails
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  # Add a comment summarizing the current schema
  gem 'annotate'
  # Styled errors showcase
  gem 'better_errors'
  gem 'binding_of_caller'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  # Set of gems containing strategies for cleaning the database
  gem 'database_cleaner-active_record'
  # Brings back assigns to controller tests
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  # Code coverage analysis tool
  gem 'simplecov', require: false
  # One-liners to test common Rails functionality
  gem 'shoulda-matchers', '~> 5.0'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
