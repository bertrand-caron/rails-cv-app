# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load global configurations
Settings = YAML.load_file("#{Rails.root}/config/config.yml")

# Load global variable AVAILABLE_SECTIONS
AVAILABLE_SECTIONS = Settings['available-sections'].split(' ')

# Initialize the Rails application.
Rails.application.initialize!
