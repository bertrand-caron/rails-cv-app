class Referee < ActiveRecord::Base
  default_scope  { order(:rank => :desc) }
end
