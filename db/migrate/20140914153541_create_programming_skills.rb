class CreateProgrammingSkills < ActiveRecord::Migration
  def change
    create_table :programming_skills do |t|
      t.string :title
      t.integer :type
      t.text :description
      t.text :details
      t.string :hyperlink
      t.integer :rank
      t.integer :ranking

      t.timestamps
    end
  end
end
