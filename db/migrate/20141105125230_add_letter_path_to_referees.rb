class AddLetterPathToReferees < ActiveRecord::Migration
  def change
    add_column :referees, :letter_path, :string
  end
end
