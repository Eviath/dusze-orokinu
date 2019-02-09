
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem "font-awesome-rails"
# JQuery
gem 'jquery-rails'
gem 'data-confirm-modal'
gem 'rails-i18n', '~> 5.1'
gem "polish", ">= 0.1.0"

gem 'tinymce-rails'

#sprockets
gem 'sprockets-rails', '~> 3.2', '>= 3.2.1'

#messaging system rails
gem 'mailboxer'

# haml syntax
gem "haml-rails"

gem 'time_difference'

# gravatar
gem 'gravatar_image_tag'

# list styling
gem 'chosen-rails'

# gem devise
gem 'devise'
gem 'devise_lastseenable'

gem 'cancancan'
gem 'rolify'

gem 'bootsy'

gem 'rails_admin', '~> 1.3'
# Bootstrap Framework
gem 'bootstrap', '~> 4.2.1'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.11'
gem 'faker', '1.7.3'
gem 'will_paginate',           '3.1.6'
gem 'bootstrap-will_paginate'

gem 'carrierwave',             '1.2.2'
gem 'mini_magick',             '4.7.0'
gem 'redis', '~> 3.2'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem "aws-sdk-s3", require: false
group :development, :test do
  gem "awesome_print"
  gem "better_errors"
  gem "binding_of_caller"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :production do
  gem 'fog', '1.42'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]