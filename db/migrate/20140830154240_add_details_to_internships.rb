class AddDetailsToInternships < ActiveRecord::Migration
  def change
    add_column :internships, :laboratory, :string
    add_column :internships, :location, :string
  end
end
