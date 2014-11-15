source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# group :production do
# Use unicorn as the app server
gem 'unicorn'
gem 'actionpack-page_caching'
# end

gem 'redcarpet'
gem 'font-awesome-rails'
gem 'piwik_analytics', github: 'bertrand-caron/piwik-ruby-tracking'
gem 'jquery-raty-rails', github: 'bmc/jquery-raty-rails'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'therubyracer'
gem 'less-rails'
gem 'twitter-bootstrap-rails', '~> 3.2.0'
gem 'yaml_db', github: 'turgu1/yaml_db'
gem 'haml'
gem 'premailer-rails'
gem 'nokogiri'
gem 'rails-settings-cached', '0.4.1'
gem 'paleta'

gem 'sitemap_generator', github: 'kjvarga/sitemap_generator'
gem 'wysiwyg-rails'
gem 'kaminari' # adds pagination to ActiveModels

group :production do
  gem 'exception_notification'
end

group :development, :test do
  gem 'html2haml'
  # TDD
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  # Code Coverage
  gem 'simplecov'
  gem 'rubocop'
  # Code duplication
  gem 'flay'
  gem 'reek'
end
