class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.text :title
      t.string :hyperlink
      t.text :description
      t.string :report_path
      t.string :location
      t.string :duration
      t.integer :rank
      t.integer :referee_id
      t.string :company

      t.timestamps
    end
  end
end
