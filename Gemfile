
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.6.2'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgres as Database
gem 'pg'
# Use Puma as the app server
gem 'sweetalert2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rails-i18n', '~> 5.1'
# polish translation
gem "polish", ">= 0.1.0"
# cookies consent
gem 'cookies_eu'
#  object settings
gem 'ledermann-rails-settings'
# translate routes
gem 'route_translator'
#messaging system rails
gem 'mailboxer'
# webpacker 4.0 gem
gem 'webpacker', github: 'rails/webpacker'
# haml syntax
gem "haml-rails"
# Decorators for rails
gem 'draper'

gem 'annotate'

gem 'time_difference'

# build trees database
gem 'ancestry'

gem 'twitch-api'
gem 'kappa'


# gem devise
gem 'devise'
gem 'devise_lastseenable'

# permission gems
gem 'cancancan'
gem 'rolify'

gem 'rails_admin', '~> 1.3'
# Bootstrap Framework
gem 'bootstrap', '~> 4.2.1'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'
gem 'will_paginate',           '3.1.7'
gem 'bootstrap-will_paginate'
gem 'bootsnap', require: false
gem 'redis', '~> 3.2'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem "aws-sdk-s3", require: false

group :development, :test do


  gem 'slack-notifier'
  gem 'ruby-growl'
  gem 'bullet'
  gem 'pry-rails'
  gem "better_errors"
  gem "binding_of_caller"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'listen'
  gem 'faker', '1.7.3'
  gem 'rubocop', require: false
end


group :production do
  gem 'unicorn'
  gem 'unicorn-worker-killer'
end

group :development do
  gem 'puma', '~> 5.5'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]