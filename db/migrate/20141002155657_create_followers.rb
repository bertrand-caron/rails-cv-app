class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.string :email
      t.datetime :reminder

      t.timestamps
    end
  end
end
