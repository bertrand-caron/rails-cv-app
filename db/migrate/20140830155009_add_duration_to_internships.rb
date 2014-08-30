class AddDurationToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :duration, :string
  end
end
