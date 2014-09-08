class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.string :title
      t.string :location
      t.text :description
      t.string :time

      t.timestamps
    end
  end
end
