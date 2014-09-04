class AddGenderToReferees < ActiveRecord::Migration
  def change
    add_column :referees, :gender, :integer
  end
end
