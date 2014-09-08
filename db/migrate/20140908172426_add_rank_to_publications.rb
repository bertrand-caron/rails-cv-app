class AddRankToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :rank, :integer
  end
end
