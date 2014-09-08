class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :journal
      t.text :authors
      t.text :details
      t.text :abstract

      t.timestamps
    end
  end
end
