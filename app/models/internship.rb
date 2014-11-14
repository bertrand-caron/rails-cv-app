class Internship < ActiveRecord::Base
  include Listable
  include Descriptable
  default_scope  { order(rank: :desc) }
end
