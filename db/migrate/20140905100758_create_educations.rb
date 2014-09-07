class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :institution
      t.string :institution_location
      t.string :degree
      t.string :year
      t.text :description

      t.timestamps
    end
  end
end
