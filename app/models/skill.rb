class Skill < ActiveRecord::Base
  include Listable
  include Descriptable
  validates :level, presence:true, inclusion: { in: 0..5, message: 'is not an integer between 0 and 5' }
  validates :skill_type, presence:true, allow_blank: false

  #Outputs the 5-star ranking of a skill with font-awesome stars
  def star_tag
    (1..5).reduce(""){|acc,e| acc + "<i class='fa fa-star" + (e <= self.level ? '' : '-o') + "'></i>"}
  end

  def skill_type_new
  end

  def skill_type_new=(skill_type)
    self.skill_type = skill_type if skill_type.to_s != ''
  end

end
