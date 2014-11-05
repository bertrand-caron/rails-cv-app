# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load global configurations
Settings = YAML.load_file("#{Rails.root}/config/config.yml")

# Initialize the Rails application.
Rails.application.initialize!
