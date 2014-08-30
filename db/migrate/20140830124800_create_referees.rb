class CreateReferees < ActiveRecord::Migration
  def change
    create_table :referees do |t|
      t.string :name
      t.string :email
      t.text :title

      t.timestamps
    end
  end
end
