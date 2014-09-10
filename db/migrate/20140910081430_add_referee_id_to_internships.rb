class AddRefereeIdToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :referee_id, :integer
  end
end
