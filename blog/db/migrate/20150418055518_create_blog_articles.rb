class CreateBlogArticles < ActiveRecord::Migration
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
