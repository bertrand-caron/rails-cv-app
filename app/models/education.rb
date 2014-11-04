class Education < ActiveRecord::Base
  include Listable
  default_scope  { order(:rank => :desc) }
end
