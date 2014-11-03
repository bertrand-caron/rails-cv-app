class ProgrammingSkill < ActiveRecord::Base
  validates :ranking, presence:true, inclusion: { in: 0..5, message: 'is not an integer between 0 and 5' }
  validates :rank, numericality: true
end
