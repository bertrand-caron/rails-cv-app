module ProgrammingSkillsHelper
  #Outputs the 5-star ranking of a skill with font-awesome stars
  def star_tag(skill)
    raw (1..5).reduce(""){|acc,e| acc + "<i class='fa fa-star" + (e <= skill.ranking ? '' : '-o') + "'></i>"}
  end
end
