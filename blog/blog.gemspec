$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blog"
  s.version     = Blog::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Blog."
  s.description = "TODO: Description of Blog."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency "haml", "~> 4.0.6"
  s.add_dependency "font-awesome-rails", "~> 4.3.0"
  s.add_dependency "twitter-bootstrap-rails", "~> 3.2.0"
  s.add_dependency "jquery-rails", "~> 4.0.3"
  s.add_dependency "redcarpet", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
end
