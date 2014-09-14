class RenameTypeFromProgrammingSkills < ActiveRecord::Migration
  def change
    rename_column :programming_skills, :type, :skill_type
  end
end
