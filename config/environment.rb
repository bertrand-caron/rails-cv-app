# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load global configurations
Settings = YAML.load_file("#{Rails.root}/config/config.yml")
Settings['cv_or_blog_url'] = Settings['use-blog-engine'] ? '/blog' : '/'

# Load global variable AVAILABLE_SECTIONS
AVAILABLE_SECTIONS = Settings['available-sections'].split(' ')

# Initialize the Rails application.
Rails.application.initialize!
