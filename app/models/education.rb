class Education < ActiveRecord::Base
  default_scope  { order(:rank => :desc) }
end
