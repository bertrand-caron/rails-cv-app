class AddHyperlinkToSoftwares < ActiveRecord::Migration
  def change
    add_column :softwares, :hyperlink, :string
  end
end
