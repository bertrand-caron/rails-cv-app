class AddExtractToUploadedFiles < ActiveRecord::Migration
  def change
    add_column :uploaded_files, :extract, :string
  end
end
