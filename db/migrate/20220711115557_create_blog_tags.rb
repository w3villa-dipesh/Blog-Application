class CreateBlogTags < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_tags do |t|
      t.integer :blog_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
