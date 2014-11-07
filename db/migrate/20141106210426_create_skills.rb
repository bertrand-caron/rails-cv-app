class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title
      t.string :skill_type
      t.text :description
      t.text :details
      t.string :hyperlink
      t.integer :rank
      t.integer :level
      t.string :icon

      t.timestamps
    end
  end
end
