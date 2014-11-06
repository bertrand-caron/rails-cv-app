class ProgrammingSkill < ActiveRecord::Base
  include Listable
  include Descriptable
  validates :ranking, presence:true, inclusion: { in: 0..5, message: 'is not an integer between 0 and 5' }
end
