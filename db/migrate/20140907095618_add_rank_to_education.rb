class AddRankToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :rank, :integer
  end
end
