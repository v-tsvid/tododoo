source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use sqlite3 as the database for Active Record
gem 'pg', '0.18.4'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'cancancan', '1.15.0'
gem 'haml', '4.0.7'
gem 'omniauth-facebook', '4.0.0'

gem 'rspec-rails', '3.5.2'
gem 'faker', '1.6.6'
gem 'factory_girl_rails', '4.7.0'
gem "rubycritic", '2.9.3', require: false
gem "bower-rails", '0.10.0'
gem "foreman", '0.82.0'
gem 'angular-rails-templates', '1.0.2'
gem 'bootstrap-sass', '3.3.5.1'
gem 'devise_token_auth', '0.1.40'
gem 'rack-cors', require: 'rack/cors'

group :production, :staging do
  gem "rails_12factor", '0.0.3'
  gem "rails_stdout_logging", '0.0.5'
  gem "rails_serve_static_assets", '0.0.5'
end


# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'selenium-webdriver', '2.53.4'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'database_cleaner', '1.5.3'
  gem 'shoulda-matchers', '3.1.1'
  gem 'shoulda-callback-matchers', '1.1.4'
  gem "codeclimate-test-reporter", '0.6.0', require: nil
  gem 'simplecov', '0.10.0', require: false
end

