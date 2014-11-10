class ChangeLetterLinkingForUploadedFiles < ActiveRecord::Migration
  def change
    remove_column :referees, :letter_path
    add_column :referees, :uploaded_file_id, :integer
  end
end
