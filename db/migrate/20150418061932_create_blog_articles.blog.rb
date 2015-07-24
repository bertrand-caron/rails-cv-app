# This migration comes from blog (originally 20150418055518)
class CreateBlogArticles < ActiveRecord::Migration
  def change
    create_table :blog_articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
