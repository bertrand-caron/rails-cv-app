class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|
      t.text :title
      t.string :hyperlink
      t.text :description
      t.string :report_path

      t.timestamps
    end
  end
end
