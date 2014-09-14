class AddThumbnailLinkToReferees < ActiveRecord::Migration
  def change
    add_column :referees, :thumbnail_img, :string
  end
end
