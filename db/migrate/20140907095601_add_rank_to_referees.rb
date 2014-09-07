class AddRankToReferees < ActiveRecord::Migration
  def change
    add_column :referees, :rank, :integer
  end
end
