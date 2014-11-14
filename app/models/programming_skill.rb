class ProgrammingSkill < ActiveRecord::Base
  include Listable
  include Descriptable
  validates :ranking, presence: true, inclusion: { in: 0..5, message: 'is not an integer between 0 and 5' }

  # Outputs the 5-star ranking of a skill with font-awesome stars
  def star_tag
    (1..5).reduce('') { |a, e| a + "<i class='fa fa-star" + (e <= ranking ? '' : '-o') + "'></i>" }
  end
end
