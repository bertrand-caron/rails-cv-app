class Internship < ActiveRecord::Base
  default_scope  { order(:rank => :desc) }
end
