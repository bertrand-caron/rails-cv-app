class AddIconToProgrammingLanguages < ActiveRecord::Migration
  def change
    add_column :programming_skills, :icon, :string
  end
end
