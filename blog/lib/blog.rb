require "blog/engine"
require 'haml'
require 'font-awesome-rails'
require 'jquery-rails'
require 'twitter-bootstrap-rails'
require 'redcarpet'
require 'yaml'

module Blog
  APP_CONFIG = YAML.load_file("#{Blog::Engine.root}/config/config.yml")
end
