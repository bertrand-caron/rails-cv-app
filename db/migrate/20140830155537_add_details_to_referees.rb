class AddDetailsToReferees < ActiveRecord::Migration
  def change
    add_column :referees, :personal_page, :text
  end
end
