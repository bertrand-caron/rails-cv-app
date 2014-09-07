class AddRankToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :rank, :integer
  end
end
