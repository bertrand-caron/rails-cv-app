class AddRankToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :rank, :integer
  end
end
